class Sortable
  DEFAULT_ORDER = 'asc'.freeze

  def initialize(column, title, params)
    @column = column
    @title = title || column.titleize
    @params = params
    @sort_params = { order: [], filter: @params[:filter] }
  end

  def call
    add_previous_order unless @params[:order].nil?
    if @sort_params[:order].include?(@column)
      revert_order
      set_clear_params
      set_position
    else
      add_order
      reset_clear_params
    end

    build_data
  end


  private

  def add_previous_order
    @sort_params[:order] << @params[:order]
    @sort_params[:order].flatten!
    @clear_params = Marshal.load(Marshal.dump(@sort_params))
  end

  def build_data
    OpenStruct.new(css: set_css, icon: set_icon, title: @title, position: @column_position, sort_params: @sort_params, clear_params: @clear_params)
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

  def set_clear_params
    column_index = @clear_params[:order].find_index(@column)
    2.times{|x| @clear_params[:order].delete_at(column_index) }
  end

  def reset_clear_params
    @clear_params = nil
  end

  def set_position
    @column_position = @sort_params[:order].each_slice(2).map(&:first).find_index(@column) + 1
  end

  def set_css
    return nil unless @params[:order]

    @column == @params[:order].detect { |e| e == @column } ? 'current' : nil
  end

  def set_icon
    if @params[:order] && @params[:order].detect { |e| e == @column } == @column && @params[:order][ @params[:order].find_index(@column) + 1 ]
      @column == @params[:order].detect { |e| e == @column } && @params[:order][ @params[:order].find_index(@column) + 1 ] == 'asc' ? SortNParams.sort_asc_class : SortNParams.sort_desc_class
    end
  end
end
