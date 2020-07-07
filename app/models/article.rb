class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # khi xoa 1 article thi tat ca comment cung bi xoa theo
end
