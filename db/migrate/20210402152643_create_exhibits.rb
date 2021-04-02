class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.belongs_to :zone, null: false, foreign_key: true
      t.text :description
      t.text :species_fact

      t.timestamps
    end
  end
end
