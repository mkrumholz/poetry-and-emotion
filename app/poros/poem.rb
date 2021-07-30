class Poem 
  attr_reader :title, :author, :content
  
  def initialize(details)
    @title = details[:title]
    @author = details[:author]
    @content = details[:content]
  end
end
