class Meme < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :categorizations
  has_many :categories, :through => :categorizations

  #scope :featured, lambda{|featured| where('featured = ?', featured )}
end