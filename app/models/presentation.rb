class Presentation < Document
  @@default_font = :nimbus

  class << self
    attr_accessor :default_font
  end

  def self.default_font=(font)
    @@default_font = font
  end

  def self.default_font
    @@default_font
  end

  attr_accessor :font

  def initialize(title, author)
    @title = title
    @author = author
    @font = Presentation.default_font
  end
end