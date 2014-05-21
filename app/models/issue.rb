class Issue < ActiveRecord::Base
  belongs_to :candidate
  validates :title, :description, :citation, :candidate_id, :presence => true
  attr_accessible :description, :title, :citation
end
