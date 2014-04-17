class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :memes, :through => :categorizations
end
