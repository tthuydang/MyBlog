module ApplicationHelper

  # if on active page => color = white
  # if not on active page => color = regular
  # takes arguments: 'link', which controller, 'what page its on', 'url', 'change font color'
  def active_link_to(nav_link, controller, action, url, style)
    if controller_name == controller && action_name == action # index, new, show, edit,...
      link_to(nav_link, url, id: style)
    else
      link_to(nav_link, url, class: style)
    end
  end
end
