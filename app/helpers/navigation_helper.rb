module NavigationHelper

  def currently_at(tab)
    render partial: 'layouts/navigation', locals: { current_tab: tab }
  end

  def currently_at_left(tab, sub_tab = nil)
    render partial: 'layouts/left_navigation', locals: { current_tab: tab, current_sub_tab: sub_tab }
  end

  def nav_tab(title, path, current_tab)
    active_class = title == current_tab ? 'active' : ''
    content_tag :li, role: 'presentation', class: active_class do
      link_to title, path
    end
  end

  def left_tab_sub_tabs(tab, sub_tab)
    path = tab == 'Admin' ? 'admin' : 'home'
    render partial: "#{path}/left_nav", locals: { current_sub_tab: sub_tab }
  end

end
