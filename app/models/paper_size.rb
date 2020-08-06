module Rendering
  class PaperSize
    attr_accessor :name, :width, :height
    
    def initialize( name='US-Let', width=8.5, height=11.0 )
      @name = name
      @width = width
      @height = height
    end
  end
  DEFAULT_PAPER_SIZE = PaperSize.new
end