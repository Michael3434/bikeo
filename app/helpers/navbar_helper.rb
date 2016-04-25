module NavbarHelper
  def navbar_class
    if controller_name == 'pages'
      if action_name == 'home'
        "navbar-inverse"
      end
    else
      "navbar"
    end
  end
end
