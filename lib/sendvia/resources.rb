require 'sendvia/resources/base'
Dir.glob("#{File.dirname(__FILE__)}/resources/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/shipment/*").each { |file| require(file) } 
