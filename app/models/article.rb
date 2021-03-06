class Article < ApplicationRecord
  extend FriendlyId
  include Wisper::Publisher
  
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :delete_all
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 10 } 
  validates :author, :image, presence: true

  after_create :new_post_email

  scope :featured, -> { newest.first }
  scope :newest, -> { order(created_at: :desc) }

  private

  def new_post_email
    broadcast(:new_article_email)
  end
end



