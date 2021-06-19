class CreateStoryGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :story_genres do |t|
      t.integer :story_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
