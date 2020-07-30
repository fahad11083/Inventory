class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
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