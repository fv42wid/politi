class Issue < ActiveRecord::Base
  belongs_to :candidate
  validates :title, :stance, :description, :citation, :candidate_id, :presence => true
  attr_accessible :description, :title, :citation, :stance, :conflict_title, :conflict_description, :conflict_citation
  STANCES = ['SUPPORTS', 'AGAINST']
end
