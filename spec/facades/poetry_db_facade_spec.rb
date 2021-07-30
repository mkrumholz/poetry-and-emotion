require 'rails_helper'

RSpec.describe PoetryDbFacade do
  describe '.top_10_poems_by' do
    it 'returns an array of ten poems by a searched author' do
      search = 'Emily'

      poems = PoetryDbFacade.top_10_poems_by('Emily')

      expect(poems).to be_an Array
      expect(poems.length).to eq 10

      first_poem = poems.first
      expect(first_poem).to be_a Poem
      expect(first_poem.title).to eq "Not at Home to Callers"
      expect(first_poem.author).to eq 'Emily Dickinson' 
      expect(first_poem.content).to eq "Not at Home to Callers / Says the Naked Tree -- / Bonnet due in April -- / Wishing you Good Day --"
    end
  end
end
