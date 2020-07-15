class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # khi xoa 1 article thi tat ca comment cung bi xoa theo
  validates :title, presence: true,
                    length: { minimum: 2 }
  validates :text, presence: true,
                   length: { minimum: 2 }

  def self.search(params)
    articles = Article.where('text LIKE ? or title LIKE ?', "%#{params[:search]}%", "%#{params[:search]}") if params[:search].present?
    articles
  end

end
