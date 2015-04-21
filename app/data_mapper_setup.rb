require 'data_mapper'

env = ENV['RACK-ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/rockpaperscissors_#{env}")

require_relative 'models/user'

DataMapper.finalize
