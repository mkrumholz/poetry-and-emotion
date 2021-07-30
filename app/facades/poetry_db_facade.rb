class PoetryDbFacade
  def self.top_10_poems_by(author)
    response = PoetryDbService.poems_by(author)
    all_poems = response.map do |poem_details|
      poem = Poem.new(poem_details)
    end
    all_poems.first(10)
  end
end
