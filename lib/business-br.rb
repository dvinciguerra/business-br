require "business-br/version"

# register our paths
lib_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'business-br/cep'

module Business::BR
  def self::load(clazz)
    clazz.new
  end
end
