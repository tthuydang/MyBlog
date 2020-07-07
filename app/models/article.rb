class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # khi xoa 1 article thi tat ca comment cung bi xoa theo
  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :text, presence: true,
                   length: { minimum: 2 }
end
