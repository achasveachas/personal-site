class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"

  def location
    location = [city, region, country].select{|i| i && !i.empty?}.join(', ')
  end

  def next
    self.class.where('id > ?', self.id).order('id asc').first
  end

  def previous
    self.class.where('id < ?', self.id).order('id asc').last
  end

end
