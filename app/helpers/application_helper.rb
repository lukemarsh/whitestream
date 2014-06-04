module ApplicationHelper
  def avatar_url(user)
    if user.profile_picture.present?
      user.profile_picture_url(:thumb)
    else
      default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
