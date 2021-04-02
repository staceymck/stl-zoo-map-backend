class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.belongs_to :zone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
