Dir.glob("#{File.dirname(__FILE__)}/resources/base/*").each { |file| require(file) }
require 'sendvia/resources/base'
Dir.glob("#{File.dirname(__FILE__)}/resources/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/shipment/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/carrier/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/carrier/service/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/carrier/service/route/*").each { |file| require(file) }
Dir.glob("#{File.dirname(__FILE__)}/resources/parcel/*").each { |file| require(file) } 
