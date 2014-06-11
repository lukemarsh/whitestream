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

  def link_to_login_with(provider, url, html_options = {})
    add_default_class(html_options)
    convert_popup_attributes(html_options)

    link_to t('.login_with_link', provider: provider), url, html_options
  end

  private

    def add_default_class(html_options)
      default_class = "js-popup"

      if html_options.has_key?(:class)
        html_options[:class] << " " << default_class
      else
        html_options[:class] = default_class
      end

      if html_options.has_key?(:id)
        html_options[:id]
      end
    end

    def convert_popup_attributes(html_options)
      width = html_options.delete(:width)
      height = html_options.delete(:height)

      if width && height
        html_options[:data] ||= {}
        html_options[:data].merge!({width: width, height: height})
      end
    end
end
