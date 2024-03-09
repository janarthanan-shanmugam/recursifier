# frozen_string_literal: true

require_relative "recursifier/version"

module Recursifier
  module RecursiveQuery

    class InvalidQueryError < StandardError; end

    def self.fetch_hierarchy(table_name, parent_matching_column, sub_matching_column, start_id, filters = {}, selected_columns = [], max_depth = 10, current_depth = 0)
     
       # Validate inputs
      raise InvalidQueryError, "Table name must be a string" unless table_name.is_a?(String)
      raise InvalidQueryError, "Selected columns must be an array of strings" unless selected_columns.is_a?(Array) && selected_columns.all? { |col| col.is_a?(String) }
 
      begin
        # Check if the current depth exceeds the maximum depth limit
        if current_depth > max_depth
          return { error: "Maximum recursion depth exceeded" }
        end

        # Convert filters hash into SQL conditions
        filter_conditions = filters.map { |key, value| "#{key} = '#{value}'" }.join(' AND ')

        # Convert selected_columns array into comma-separated column names
        selected_columns_str = selected_columns.empty? ? '*' : selected_columns.join(', ')

        # Constructing the recursive query with additional filters and selected columns
        query = <<-SQL
          WITH RECURSIVE hierarchy AS (
            SELECT #{selected_columns_str}, 1 AS depth FROM #{table_name} WHERE #{parent_matching_column} = #{start_id} #{filter_conditions}
            UNION ALL
            SELECT #{selected_columns_str}, h.depth + 1 FROM #{table_name} t
            JOIN hierarchy h ON t.#{sub_matching_column} = h.#{parent_matching_column} WHERE h.depth < #{max_depth}
          )
          SELECT #{selected_columns_str} FROM hierarchy;
        SQL

        # Executing the query and return the result
        ActiveRecord::Base.connection.execute(query)

      rescue ActiveRecord::StatementInvalid => e
        if e.message.include?("statement timeout")
          # Handle statement timeout error
          error_message = "Statement Timeout: #{e.message}"
        else
          # Handle other errors
          error_message = "Error: #{e.message}"
        end

        # Return the error message as part of the response
        { error: error_message }
      end
    end
  end
end