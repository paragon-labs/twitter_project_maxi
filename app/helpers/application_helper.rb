module ApplicationHelper

  def sortable_column(column, column_name)
    button_tag column_name, data: { sort_column: column, sort_direction: 'desc' }, class: 'sort-column'
  end

end
