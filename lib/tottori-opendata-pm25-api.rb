require 'tottori-opendata-pm25-api/version'
require 'tottori-opendata-pm25-api/client'

module Tottori; module OpenData; module PM25; module API

def self.get(time)
  Client.get(time)
end

end; end; end; end
