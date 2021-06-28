class AddMediumToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :medium, :string
  end
end
