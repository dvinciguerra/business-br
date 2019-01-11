#!/usr/bin/env ruby

require 'business-br'

cep = '13330-000'
validator = Business::BR::CEP.new

# turns from '13330-000' into '13330000'
cep = validator.normalize(cep)
puts "CEP Normalized: #{cep}"


# turns from '13330000' into '13330-000'
cep = validator.format(cep)
puts "CEP Formated: #{cep}"

# getting cep region
cep_region = validator.region(cep) # => ['SP']
puts "CEP Region: #{cep_region}"

# getting cep type
cep_type = validator.type(cep) # => 'LOGRADOURO'
puts "CEP Type: #{cep_type}"


# check if cep is valid
if validator.valid? '00000asd'
  puts 'This CEP is valid'
else
  puts 'This CEP is not valid... please try again!'
end

# getting cep information
cep = Business::BR::CEP.new
if infor = cep.search_by('04207002') # or using an invalid CEP 12345678
  puts "CEP: #{infor}"
else
  puts "NOT FOUND"
end
