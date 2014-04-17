class Categorization < ActiveRecord::Base
  belongs_to :meme
  belongs_to :category
end
