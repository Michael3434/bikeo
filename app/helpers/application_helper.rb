module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image
    else
    "https://s.gravatar.com/avatar/#{gravatar_id}?s=150"
    end
  end

  def navbar_bg
    if controller_name == "pages" && action_name == "home"
      "transparent"
    else
      "normal"
    end
  end
end
