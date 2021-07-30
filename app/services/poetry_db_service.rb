class PoetryDbService
  def self.poems_by(author)
    response = Faraday.get("https://poetrydb.org/author/#{author}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
