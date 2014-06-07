class AddCreatorIdToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :creator_id, :integer
  end
end
