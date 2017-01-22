require 'test_helper'

class Tottori::OpenData::PM25::ApiTest < Minitest::Test

  @@data = Tottori::OpenData::PM25::API.get(Time.now)

  def test_version
    refute_nil Tottori::OpenData::PM25::API::VERSION
  end

  def data
    @@data
  end

  def test_name
    @@data.each do |data|
      refute_empty(data[:name])
    end
  end

  def test_values_size
    @@data.each do |data|
      assert(data[:values].size == 24)
    end
  end

  def test_values_time
    require 'time'
    @@data.each do |data|
      data[:values].each do |value|
        assert_kind_of(Time, value[:time])
      end
    end
  end

  def test_values_data
    @@data.each do |data|
      data[:values].each do |value|
        if !value[:value].nil?
          assert_kind_of(Integer, value[:value])
        end
      end
    end
  end

end
