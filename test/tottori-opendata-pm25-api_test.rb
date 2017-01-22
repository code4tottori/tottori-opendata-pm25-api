require 'test_helper'

class Tottori::OpenData::PM25::ApiTest < Minitest::Test

  def test_version
    refute_nil Tottori::OpenData::PM25::API::VERSION
  end

  def test_get
    Tottori::OpenData::PM25::API.get(Date.today)
  end

end
