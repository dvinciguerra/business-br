#!/usr/bin/env ruby

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

# getting cep information
cep = Business::BR::CEP.new 
if infor = cep.search_by('12345678')
  puts "CEP: #{infor}"
else
  puts "NOT FOUND"
end
