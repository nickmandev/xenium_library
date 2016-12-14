class Book < ActiveRecord::Base

  has_many :reviews
  has_attached_file :picture, styles: {default: '90x160>'}
  validates_attachment :picture, presence: true,
      content_type: {content_type:['image/jpeg', 'image/png']}
  validates :title, length: {in: 2..100}
  validates :description, presence: true, length: {maximum: 1000}
  validates :isbn, length: {in: 10..13}, uniqueness: true
end
