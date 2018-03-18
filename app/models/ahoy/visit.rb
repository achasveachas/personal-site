class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"

  def location
    location = [city, region, country].select{|i| i && !i.empty?}.join(', ')
  end

end
