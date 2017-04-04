module NavigationHelper

  def currently_at(tab)
    render partial: 'layouts/navigation', locals: { current_tab: tab }
  end

  def top_nav_tab(title, path, current_tab)
    title == current_tab ? active_class = 'active' : active_class = ''
    content_tag :li, role: 'presentation', class: active_class do
      link_to title, path
    end
  end

end
