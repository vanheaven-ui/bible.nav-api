class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :book_name
      t.string :chapter_num
      t.string :verse_num
      t.string :verse
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
