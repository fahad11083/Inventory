class Document
  @@default_paper_size = :a4
  @default_font = :times

  def self.default_font=(font)
    @default_font = font
  end

  def self.default_font
    @default_font
  end

  def self.default_paper_size
    @@default_paper_size
  end

  def self.default_paper_size=(new_size)
    @@default_paper_size = new_size
  end

  attr_accessor :title, :author, :content, :default_font

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
    @paper_size = @@default_paper_size
    @font = Document.default_font
  end

  def +@
    Document.new( @title, @author, "I am sure that #{@content}" )
  end

  def -@
    Document.new( @title, @author, "I doubt that #{@content}")
  end

  def [](index)
    words[index]
  end

  def +(other)
    if other.kind_of?(String)
      return Document.new( @title, @author, "#{@content} #{other}")
    end
    Document.new( @title, @author, "#{@content} #{@other.content}" )
  end
end