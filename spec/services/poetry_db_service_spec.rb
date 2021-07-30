require 'rails_helper'

RSpec.describe PoetryDbService do
  describe '.poems_by' do
    it 'returns a list of poems by authors matching a search' do
      search = 'Emily'

      response_body = File.read('./spec/fixtures/poems_by_emily.json')

      stub_request(:get, "https://poetrydb.org/author/#{search}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.1'
           }).
         to_return(status: 200, body: response_body, headers: {})

      response = PoetryDbService.poems_by('Emily')

      expect(response).to be_an Array

      first_poem = response.first
      expect(first_poem).to be_a Hash

      expect(first_poem).to have_key :title
      expect(first_poem[:title]).to eq "Not at Home to Callers"

      expect(first_poem).to have_key :author
      expect(first_poem[:author]).to eq 'Emily Dickinson' 

      expect(first_poem).to have_key :lines
      expect(first_poem[:lines]).to be_an Array
      expect(first_poem[:lines].first).to eq "Not at Home to Callers"

      expect(first_poem).to have_key :linecount
      expect(first_poem[:linecount]).to eq "4"
    end
  end
end
