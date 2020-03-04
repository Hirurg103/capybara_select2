# CapybaraSelect2 for select2 version 2/3/4
!!! CapybaraSelect2 detects select2 version automatically

[![Build Status](https://travis-ci.org/Hirurg103/capybara_select2.svg?branch=master)](https://travis-ci.org/Hirurg103/capybara_select2)
[![Maintainability](https://api.codeclimate.com/v1/badges/28e692c7efa07aadbe98/maintainability)](https://codeclimate.com/github/Hirurg103/capybara_select2/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/28e692c7efa07aadbe98/test_coverage)](https://codeclimate.com/github/Hirurg103/capybara_select2/test_coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'capybara-select-2'
end
```

And then execute:

    $ bundle

Or install it with `gem install` command:

    $ gem install capybara-select-2

## Configuration

### Minitest

```ruby
# application_system_test_case.rb
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CapybaraSelect2::Helpers
end
```

### Rspec

```ruby
# spec_helper.rb
RSpec.configure do |config|
  config.include CapybaraSelect2
end
```
[Note] In RSpec tests `select2` helper is available out of the box

### Cucumber

```ruby
# env.rb
World CapybaraSelect2
```

## Usage

### Examples

```ruby
select2 'Buy Milk', css: '#todo'
select2 'Buy Milk', xpath: '//div[@id="todo"]'
select2 'Buy Milk', from: 'Things to do'
select2 'Buy Milk', 'Go to gym', css: '#todo'

select2 'Buy Milk', from: 'Things to do', search: true
select2 'Millennials', from: 'Generation', tag: true
```

[Note] CSS and XPath selectors must identify an HTML node that wraps select2 element or a select2 element itself (an HTML element with the `.select2-container` class)

### Options

Option | Purpose
:------|:-------
css | Identify select2 element by a CSS selector
xpath | Identify select2 element by an XPath selector
from | Identify select2 element by a label
search | Search for an option
tag | Create an option
match | Specifies Capybara's [matching strategy](https://github.com/teamcapybara/capybara#strategy) when selecting an option
exact_text | Whether an option text must match exactly

### RSpec matchers

```ruby
# Check that a select2 option with specified text is present on the page
expect(page).to have_select2_option 'Buy Milk'
```

## Testing

### See test examples

To see test examples for a specific select2 version, start Sinatra app first:

```bash
$ rackup spec/support/select2_examples/config.ru
```

Visit http://localhost:9292/select2/v4.0.5/examples in your browser to see examples for select2 version `4.0.5`

### Running tests

```bash
# run spec cases for all select2 versions
$ bundle exec rspec

# run spec cases for a specific select2 version
$ VERSION=4.0.5 bundle exec rspec spec/shared
```

## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
