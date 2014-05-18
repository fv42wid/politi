class Candidate < ActiveRecord::Base
  validates :name, :description, :image_url, :presence => true
  attr_accessible :description, :image_url, :name
end
