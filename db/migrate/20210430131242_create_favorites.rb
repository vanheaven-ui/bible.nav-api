class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :book_name
      t.string :chapter_num
      t.string :verse_num
      t.text :verse
      t.string :created_by

      t.timestamps
    end
  end
end
