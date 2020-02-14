# frozen_string_literal: true

# register our paths
lib_dir = __dir__
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'business-br/version'

require 'business-br/cep'
require 'business-br/cpf'
require 'business-br/cnpj'
