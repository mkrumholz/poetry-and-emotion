class PoetryDbFacade
  def self.top_10_poems_by(author)
    response = PoetryDbService.poems_by(author)
    first_10_poems = response.first(10)
    first_10_poems.map do |poem_details|
      content = poem_details[:lines].join(' / ')
      poem_details[:tone] = ToneAnalyzerFacade.analyze(content)
      poem = Poem.new(poem_details)
    end
  end
end
