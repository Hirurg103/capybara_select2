# CapybaraSelect2 for select2 version 2/3/4
!!! For select2 versions 2 and 3 you need to specify which version you are using. See [Configuration](https://github.com/Hirurg103/capybara_select2#configuration)

[![Build Status](https://travis-ci.org/Hirurg103/capybara_select2.svg?branch=master)](https://travis-ci.org/Hirurg103/capybara_select2)

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

[Note] In the projects which use RSpec or Cucumber `select2` helper is available out of the box

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

## Configuration

CapybaraSelect2 expects select2 version 4 by default. If you are using version 3 or 2 please specify it in your spec helper

```ruby
CapybaraSelect2::Config.select2_version = 3

# or

CapybaraSelect2.configure do |config|
  config.select2_version = 3
end
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

## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
