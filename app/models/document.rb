class Document
  include WritingClitch
  include Finders
  include Rendering
  include Enumerable

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

  def each
    words.each { |word| yield( word ) }
  end
  def each_word
    words = content.split
    words.each { |word| yield( word ) }
  end

  def each_word_pair
    words.each_cons(2) { |array| yield array[0], array[1] }
  end

  def each_character
    index = 0
    while index < @content.size
      yield( @content[index] )
      index += 1
    end
  end
  
  def applying_blocks
    def do_something_with_an_arg
      yield("Hello World") if block_given?
    end

    do_something_with_an_arg do |message|
      "The message is #{message}"
    end
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