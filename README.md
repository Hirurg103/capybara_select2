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

Or install it yourself as:

    $ gem install capybara-select-2

[Note] In the projects which use RSpec or Cucumber, the `select2` helper is available out of the box

### Manual installation with Minitest

In your application_system_test_case.rb

```ruby
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CapybaraSelect2::Helpers
end
```

### Manual installation with Rspec

In your spec_helper.rb

```ruby
RSpec.configure do |config|
  config.include CapybaraSelect2
end
```

### Manual installation with Cucumber

In your env.rb

```ruby
World CapybaraSelect2
```

## Usage

### Select from a node containing select2 control

* Identified by CSS selector
```ruby
select2 'Buy Milk', css: '#todo'
```

* Identified by XPath selector
```ruby
select2 'Buy Milk', xpath: '//div[@id="todo"]'
```

[Note] CSS and xPath selectors should identify a block which wraps select2 element or a select2 element itself (an html element with the `.select2-container` class)

### Select from select2 control identified by label
```ruby
select2 'Buy Milk', from: 'Things to do'
```

If you want to search for an option (via Ajax for example)
```ruby
select2 'Buy Milk', from: 'Things to do', search: true
```

### Dynamically create an option from search input 
```ruby
select2 'Millennials', from: 'Generations', tag: true
```

### Select several options at once
```ruby
select2 'Buy Milk', 'Go to gym', css: '#todo'
```

### Add match strategy in case of ambiguous results
```ruby
select2 'Buy Milk', from: 'Things to do', search: true, match: :first
```

### Search for exact text in the specified node
```ruby
select2 'Buy Milk', from: 'Things to do', exact_text: true
```

### Check for select2 option on the page
```ruby
expect(page).to have_select2_option('Buy Milk')
```
## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
