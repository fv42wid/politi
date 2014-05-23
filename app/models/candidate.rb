class Candidate < ActiveRecord::Base
  has_many :issues
  validates :name, :description, :presence => true
  attr_accessible :description, :image_url, :name
end
