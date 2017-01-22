require 'httpclient'
require 'nokogiri'
require 'time'
require 'active_support/time'

module Tottori; module OpenData; module PM25; module API; class Client; class << self

def get(t = Time.now)
  # Tottori Time
  time = t.in_time_zone('Asia/Tokyo')
  # Tottori Date
  date = time.to_date
  # URI
  uri = 'http://tottori-taiki.users.tori-info.co.jp/taiki/pc/graph/?'
  uri << [
    'mode=table',
    'graph=hour',
    "date=#{date.strftime('%Y%m%d')}",
    (1..6).map{ |i| 'term[]=%03d' % i }.join('&')
  ].join('&')
  # HTTP GET
  content = HTTPClient.get_content(uri)
  # Parse
  doc = Nokogiri::HTML.parse(content)
  # Scraping
  data = []
  doc.xpath('//table[@class="commonTable"]/tbody/tr').each do |tr|
    row = tr.children
    name = row.shift.text.strip
    values = row.map{ |c|
      s = c.text.strip
      s.empty? ? nil : s.to_i
    }.map.with_index do |value, i|
      iso8601_time = ('%4d-%02d-%02dT%02d:00:00+09:00' % [date.year, date.month, date.day, i]).strip
      {
        time: Time.iso8601(iso8601_time),
        value: value
      }
    end
    record = {
      name: name,
      values: values
    }
    data << record
  end
  return data
end

end; end; end; end; end; end
