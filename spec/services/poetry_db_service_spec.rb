require 'rails_helper'

RSpec.describe PoetryDbService do
  describe '.poems_by' do
    it 'returns a list of poems by authors matching a search' do
      search = 'Emily'
      # eventually add a file in here to be read by webmock
      # then stub out the request

      response = PoetryDbService.poems_by('Emily')

      expect(response).to be_an Array

      first_poem = response.first
      expect(first_poem).to be_a Hash

      expect(first_poem).to have_key "title"
      expect(first_poem[:title]).to eq "Not at Home to Callers"

      expect(first_poem).to have_key "author"
      expect(first_poem[:author]).to eq 'Emily Dickinson' 

      expect(first_poem).to have_key "lines"
      expect(first_poem[:lines]).to be_an Array
      expect(first_poem[:lines].first).to eq "Not at Home to Callers"

      expect(first_poem).to have_key "linecount"
      expect(first_poem[:linecount]).to eq "4"
    end
  end
end
