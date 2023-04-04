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
  include CapybaraSelect2
  include CapybaraSelect2::Helpers # if need specific helpers
end
```

### Rspec

```ruby
# spec_helper.rb
RSpec.configure do |config|
  config.include CapybaraSelect2
  config.include CapybaraSelect2::Helpers # if need specific helpers
end
```
[Note] In RSpec tests `select2` helper is available out of the box

### Cucumber

```ruby
# env.rb
World CapybaraSelect2
World CapybaraSelect2::Helpers # if need specific helpers
```

## Usage

### Examples

```ruby
select2 'Buy Milk', from: 'Todo'
select2 'Buy Milk', css: '#todo'
select2 'Buy Milk', xpath: '//div[@id="todo"]'
```

#### Selecting two or more options

```ruby
select2 'Buy Milk', 'Go to gym', from: 'Todo'
```

#### Searching

```ruby
select2 'Buy Milk', from: 'Todo', search: true
```

#### Searching by text different than an option text

```ruby
select2 'Buy Milk', from: 'Todo', search: 'Buy'
```

#### Tagging

```ruby
select2 'Go to gym', from: 'Todo', tag: true
```

#### Resolving ambiguous match

```ruby
# Select the first matching option if there are two or more options with text 'Buy'
select2 'Buy', from: 'Todo', match: :first
```

#### Selecting an option by exact text

```ruby
# Select 'Eat' if there are two or more options with text 'Eat' ('Eat', 'Eat salad')
select2 'Eat', from: 'Todo', exact_text: true
```

[Note] CSS and XPath selectors must identify an HTML node that wraps select2 element or a select2 element itself (an HTML element with the `.select2-container` class)

### Options

Option | Purpose
:------|:-------
`css` | Identify select2 element by a CSS selector
`xpath` | Identify select2 element by an XPath selector
`from` | Identify select2 element by a label
`label` | Identify select2 element by a label
`search` | Search for an option by the passed string. Search by an option text if `true` is passed
`tag` | Create an option
`match` | Specifies Capybara's [matching strategy](https://github.com/teamcapybara/capybara#strategy) when selecting an option
`exact_text` | Whether an option text must match exactly

### Helpers

Specific select2 helpers that allow more refined access to a select2 control

```ruby
select2_open label: 'Todo'
select2_close
select2_search 'Milk', css: '#todo'
select2_select 'Buy Milk', from: 'Todo'
select2_clear xpath: "//div[@id='todo']"
```

Helper | Purpose | Options
:------|:--------|:-------
`select2_open(options)` | Open select2 control | `label`, `css`, `xpath`
`select2_close` | Close select2 control | -
`select2_search(term, options)` | Type into a select2 search field | `label`, `from`, `css`, `xpath`
`select2_select(value, options)` | Select an option from an opened select2 control | `label`, `from`, `css`, `xpath`, `match`, `exact_text`
`select2_clear(options)` | Remove selected options (for multi select only) | `label`, `from`, `css`, `xpath`

See description for each option in the [Options](https://github.com/Hirurg103/capybara_select2#options) section

[Note] Helpers above are not available in tests by default. To use them include `CapybaraSelect2::Helpers` in your test invironment (see [Configuration section](https://github.com/Hirurg103/capybara_select2#configuration))

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
$ SELECT2_VERSION=4.0.5 bundle exec rspec spec/shared
```

## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
