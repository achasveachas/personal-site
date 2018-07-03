class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  before_create :truncate_database
  has_many :events, class_name: "Ahoy::Event", dependent: :destroy

  def location
    [city, region, country].select{|i| i && !i.empty?}.join(', ')
  end

  def next
    self.class.where('id > ?', self.id).order('id asc').first
  end

  def previous
    self.class.where('id < ?', self.id).order('id asc').last
  end

  def truncate_database
    self.class.first.destroy if self.class.count > 1000
  end

end
