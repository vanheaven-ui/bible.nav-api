FactoryBot.define do
  factory :favorite do
    book_name { 'Psalms' }
    chapter_num { '46' }
    verse_num { '1' }
    verse do
      'To the chief music-maker. Of the sons of Korah; put to Alamoth.'
    end
  end
end
