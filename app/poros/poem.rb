class Poem 
  attr_reader :title, :author, :content, :tone
  
  def initialize(details)
    @title = details[:title]
    @author = details[:author]
    @content = details[:lines].join(' / ')
    @tone = details[:tone]
  end
end
