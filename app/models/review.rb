class Review < ActiveRecord::Base
  belongs_to :book
  validates :text, length: {in: 20..250}
end
