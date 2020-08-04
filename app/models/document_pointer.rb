class DocumentPointer
  attr_reader :folder, :name
    
  def initialize( folder, name )
    @folder = folder
    @name = name
  end
  
  def ==( other )
    return true unless other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end 
end