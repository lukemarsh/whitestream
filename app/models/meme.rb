class Meme < ActiveRecord::Base
  acts_as_voteable
  mount_uploader :image, ImageUploader
  mount_uploader :raw_image, ImageUploader

  has_many :categorizations
  has_many :categories, :through => :categorizations
  belongs_to :user
  is_impressionable
end