class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.integer :world_id
      t.string :name
      t.string :role
      t.integer :age
      t.string :gender
      t.string :species
      t.string :job
      t.string :physical
      t.string :description
      t.string :motivation

      t.timestamps
    end
  end
end
