class GridView
  attr_accessor :grid

  def initialize(content, cols)
    # convert to 2d array
    unless content.empty?
      @grid = content.each_slice(cols).to_a
      (cols - @grid.last.length).times { @grid.last.push nil }
    else
      @grid = content.each_slice(cols).to_a
    end
  end

  def each
    @grid.each {|row| yield(row)}
  end

end