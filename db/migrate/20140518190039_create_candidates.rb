class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
