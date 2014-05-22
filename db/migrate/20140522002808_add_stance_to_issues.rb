class AddStanceToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :stance, :string
  end
end
