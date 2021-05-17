class Favorite < ApplicationRecord
  belongs_to :user

  validates_presence_of :book_name, :chapter_num, :verse_num, :verse
end
