class AddConflictToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :conflict_title, :string
    add_column :issues, :conflict_description, :text
    add_column :issues, :conflict_owner_id, :integer
  end
end
