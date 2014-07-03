class Meme < ActiveRecord::Base
  acts_as_voteable
  acts_as_commentable
  mount_uploader :image, ImageUploader
  mount_uploader :raw_image, ImageUploader

  has_many :categorizations
  has_many :categories, :through => :categorizations
  belongs_to :user
  is_impressionable

  def to_param
    title = top_line.parameterize, bottom_line.parameterize
    if top_line == ""
      title = bottom_line.parameterize
    end
    if bottom_line == ""
      title = top_line.parameterize
    end
    if bottom_line == '' && top_line == ''
      title
    end
    if title == ""
      super
    else
      [id, title].join("-")
    end
  end

  def self.filter(filter)
    if filter
      joins(:categories).where('name LIKE ?', "%#{filter}")
    else
      scoped
    end
  end

  def self.sort(sort)
    if sort
      plusminus_tally({:order => "vote_count ASC"})
    else
      scoped
    end
  end

  def alt_tag
    if top_line != '' && bottom_line != ''
      top_line + ' - ' + bottom_line
    else
      id
    end
  end

  def page_title
    if top_line != '' && bottom_line != ''
      top_line + ' - ' + bottom_line + " | "
    else
      id.to_s + " | "
    end
  end

end