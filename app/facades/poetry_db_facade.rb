class PoetryDbFacade
  def self.top_10_poems_by(author)
    response = PoetryDbService.poems_by(author)
    all_poems = response.map do |poem_details|
      content = poem_details[:lines].join(' / ')
      poem_details[:tone] = ToneAnalyzerFacade.analyze(content)
      poem = Poem.new(poem_details)
    end
    all_poems.first(10)
  end
end
