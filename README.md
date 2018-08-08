# CapybaraSelect2 for select2 version 2/3/4

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'capybara_select2'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara_select2

## Usage

### Select from a container containing the select2 control

#### Identified by CSS selector

```ruby
select2 'Buy Milk', css: '#todo'
```

#### Identified by XPath selector
```ruby
select2 'Buy Milk', xpath: '//div[@id="todo"]'
```

#### Or Identified by label

```ruby
select2 'Buy Milk', from: 'Things to do'

```

## Contributing

1. Add a test case which covers the bug
2. Add code which makes the test green
3. Open pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
