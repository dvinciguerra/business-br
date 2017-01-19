#!/usr/bin/env ruby

$lib = File.expand_path('../lib/')
$LOAD_PATH.unshift $lib unless $LOAD_PATH.include? $lib

require 'json'
require 'rest-client'
require 'business-br'

cep = Business::BR::CEP.new 
puts cep.search_by('13345460')


#response = RestClient.get "http://api.postmon.com.br/v1/cep/13345360"
#puts JSON.parse(response.body)
