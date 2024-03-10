# Recursifier

The Recursifier gem provides functionalities for recursively querying hierarchical data from a database and visualizing it in an interactive organizational chart format.

## Installation

To use the Recursifier gem in your Ruby project, add it to your Gemfile:
```ruby

gem 'recursifier', '~> 1.0.0'
```


Then, run bundle install to install the gem.


## Usage

Fetch Hierarchy
To fetch hierarchical data from the database, use the fetch_hierarchy method:
```ruby
result = Recursifier::RecursiveQuery.fetch_hierarchy(
  table_name,
  parent_matching_column,
  sub_matching_column,
  start_id,
  filters = {},
  selected_columns = [],
  max_depth = 10,
  current_depth = 0
)
```


Parameters:

**table_name:** Name of the database table containing the hierarchical data.

**parent_column:** Name of the column representing the parent-child relationship.

**sub_matching_column:** Name of the column representing the child-parent relationship.

**start_id:** ID of the starting node in the hierarchy **#parent_column id.**

**filters:** Optional. Additional filters to apply to the query.

**selected_columns:** Optional. Array of columns to select from the database table.

**max_depth:** Optional. Maximum depth to traverse in the hierarchy.

**current_depth:** Optional. Current depth in the hierarchy traversal.
<br>

_**Returns:**_

An instance of **Recursifier::RecursiveQuery::HierarchicalData** containing the fetched hierarchical data.

<br>
<hr>


**Visualize Hierarchy** <br>
To visualize hierarchical data as an organizational chart, use the to_visualize method:

```ruby
visualization_html = result.to_visualize
```


_**Returns:**_

HTML code for embedding the hierarchical visualization.

<br>

<hr>


**Get Raw Data** <br>
To retrieve the raw hierarchical data fetched from the database, use the get_data method:
```ruby

raw_data = result.get_data
```


_**Returns:**_

Raw hierarchical data as a PostgreSQL PG::Result object.
<br>

<hr>



## Additional Functionalities <br>
The Recursifier gem also provides additional functionalities such as:

Customizable visualizations with interactive features.
Support for dynamic filtering and searching of hierarchical data.
Performance optimization for handling large datasets efficiently.

**Example:**

```ruby
result = Recursifier::RecursiveQuery.fetch_hierarchy(
  'employees',
  'manager_id',
  'employee_id',
  1,
  { employee_enabed: true, employee_status: active, assocaited_table_id: 12} #hash to denote the fileters
  ['column1', 'column2'] # columns to be listed
)

visualization_html = result.to_visualize

```


This example fetches hierarchical data of employees from the 'employees' table, visualizes it as an organizational chart, and returns the HTML code for embedding the visualization.

## Conclusion
The Recursifier gem simplifies the retrieval and visualization of hierarchical data, making it easier for developers to understand and analyze complex relationships within their datasets.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/recursifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/recursifier/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Recursifier project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/recursifier/blob/master/CODE_OF_CONDUCT.md).
# recursifier
