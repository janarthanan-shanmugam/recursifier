# frozen_string_literal: true

require_relative "lib/recursifier/version"

Gem::Specification.new do |spec|
  spec.name = "recursifier"
  spec.version = Recursifier::VERSION
  spec.authors = ["Jana"]
  spec.email = ["shanmugamjanarthan24@gmail.com"]

  spec.summary = "This gem is used to return the recursive data from the database in optimal way"
  spec.description = "Recursifier is a Ruby gem designed to simplify and optimize recursive querying of hierarchical data in PostgreSQL databases, particularly within Ruby on Rails applications. It provides a convenient interface for executing recursive queries, allowing users to fetch hierarchical data from their database tables in a hierarchical manner."
  spec.homepage = "https://github.com/janarthanan-shanmugam/recursifier"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/janarthanan-shanmugam/recursifier"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/janarthanan-shanmugam/recursifier"
  spec.metadata["changelog_uri"] = "https://github.com/janarthanan-shanmugam/recursifier"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'activerecord', '>= 6.0'
  spec.add_dependency 'pg', '>= 1.2'
  spec.version = '0.1.0'
  spec.add_runtime_dependency 'activerecord', '~> 6.0'


  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
