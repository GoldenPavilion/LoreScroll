class CreateWorlds < ActiveRecord::Migration[6.1]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :scale
      t.string :description

      t.timestamps
    end
  end
end
