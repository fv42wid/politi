class AddConflictCitationToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :conflict_citation, :string
  end
end
