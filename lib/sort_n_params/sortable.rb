class Sortable
  DEFAULT_ORDER = 'asc'.freeze

  def initialize(column, title, params)
    @column = column
    @title = title || column.titleize
    @params = params
    @sort_params = { order: [], filter: @params[:filter] }
  end

  def call
    add_previous_order if @params[:order].present?
    @sort_params[:order].include?(@column) ? revert_order : add_order
    build_data
  end

  private

  def add_previous_order
    @sort_params[:order] << @params[:order]
    @sort_params[:order].flatten!
  end

  def build_data
    OpenStruct.new(css: set_css, icon: set_icon, title: @title, sort_params: @sort_params)
  end

  def revert_order
    column_index = @sort_params[:order].find_index(@column)
    direction = @column == @sort_params[:order].detect { |e| e == @column } &&
      @sort_params[:order][column_index + 1] == 'asc' ? 'desc' : 'asc'
    @sort_params[:order][column_index + 1] = direction
  end

  def add_order
    @sort_params[:order] << @column
    @sort_params[:order] << DEFAULT_ORDER
  end

  def set_css
    return nil unless @params[:order]

    @column == @params[:order].detect { |e| e == @column } ? 'current' : nil
  end

  def set_icon
    if @params[:order] && @params[:order].detect { |e| e == @column } == @column && @params[:order][ @params[:order].find_index(@column) + 1 ]
      @column == @params[:order].detect { |e| e == @column } && @params[:order][ @params[:order].find_index(@column) + 1 ] == 'asc' ? 'fa fa-sort-up' : 'fa fa-sort-desc'
    end
  end
end
