require 'nokogiri'
require 'uri'

raise 'Smoke checks require production mode' unless Rails.env.production?

session = ActionDispatch::Integration::Session.new(Rails.application)
session.host! 'example.com'
session.https!
asset_paths = []

%w[/ /contact /projects /talks /magic].each do |path|
  session.get(path)
  raise "#{path} returned #{session.response.status}, expected 200" unless session.response.status == 200
  raise "#{path} did not return HTML" unless session.response.media_type == 'text/html'

  document = Nokogiri::HTML(session.response.body)
  raise "#{path} rendered an empty page" if document.at_css('body')&.text.to_s.strip.empty?

  document.css('script[src], link[rel="stylesheet"][href]').each do |element|
    asset_path = URI.parse(element['src'] || element['href']).path
    asset_paths << asset_path if asset_path&.start_with?('/assets/')
  end
  puts "PASS #{path}"
end

raise 'No compiled CSS or JavaScript assets were linked' if asset_paths.empty?

asset_paths.uniq.each do |path|
  session.get(path)
  raise "Asset #{path} returned #{session.response.status}, expected 200" unless session.response.status == 200
  raise "Asset #{path} was empty" if session.response.body.empty?
  puts "PASS #{path}"
end