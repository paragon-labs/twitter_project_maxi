module SortColumns
  extend ActiveSupport::Concern

  def sort_order
    sort_column = sort_class.sortable_columns.include?(params[:sortColumn]) ? params[:sortColumn] : sort_class.default_column
    sort_direction = params[:sortDirection] || 'asc'
    { sort_column => sort_direction }
  end

  def sort_class
    raise 'not implemented yet'
  end

end
