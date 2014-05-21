class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.String :title
      t.text :description

      t.timestamps
    end
  end
end
