module ApplicationHelper

  def sortable_column(column, column_name)
    direction = sort_direction == 'asc' ? 'desc' : 'asc'
    link_to column_name, { sort_column: column, sort_direction: direction }, class: 'sort-column'
  end

  def sort_direction
    ['asc', 'desc'].include?(params[:sort_direction]) ? params[:sort_direction] : 'asc'
  end

end
