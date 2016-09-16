# Business::BR

[![Gem Version](https://badge.fury.io/rb/business-br.svg)](https://badge.fury.io/rb/business-br)
[![Build Status](https://travis-ci.org/dvinciguerra/business-br.svg?branch=master)](https://travis-ci.org/dvinciguerra/business-br)

This gem is a namespace of brazilian documents, ids and currencies validations that provide you simple
way for make validations in your ruby application.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'business-br'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install business-br

## Usage


### For CEP

Using class CEP and validations methods:

```ruby
require 'business-br'

cep = '13330-000'
validator = Business::BR::CEP.new

# turns from '13330-000' into '13330000'
cep = validator.normalize(cep)


# turns from '13330000' into '13330-000'
cep = validator.format(cep)

# getting cep region
cep_region = validator.region(cep) # => ['SP']

# getting cep type
cep_type = validator.type(cep) # => 'LOGRADOURO'


# check if cep is valid
if validator.valid? '00000asd'
  puts 'This CEP is valid'
else 
  puts 'This CEP is not valid... please try again!'
end
```


### For CPF

Using class CPF and validations methods:

```ruby
require 'business-br'

cpf = '111.111.111-11'
validator = Business::BR::CPF.new

# turns from '111.111.111-11' into '11111111111'
cpf = validator.normalize(cpf)

# turns from '11111111111' into '111.111.111-11'
cpf = validator.format(cpf)


# check if cpf is valid
if validator.valid? '111.111.111-11'
  puts 'This CPF is valid'
else 
  puts 'This CPF is not valid... please try again!'
end
```


## Development

After checking out the repon, run bundle install to resolve dependencies and then run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvinciguerra/business-br.


## Authors

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>
