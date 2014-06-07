class Candidate < ActiveRecord::Base
  has_many :issues
  validates :name, :description, :creator_id, :presence => true
  attr_accessible :description, :image_url, :name

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
