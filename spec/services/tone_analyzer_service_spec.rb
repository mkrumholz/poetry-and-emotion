require 'rails_helper'

RSpec.describe ToneAnalyzerService do
  describe '.analyze_tone' do
    it 'returns a json response with the tone analysis of the text' do
      poem = "Not at Home to Callers / Says the Naked Tree -- / Bonnet due in April -- / Wishing you Good Day --"

      response = ToneAnalyzerService.analyze_tone(poem)

      expect(response).to be_a Hash
      expect(response).to have_key :document_tone
      
      doc_tone = response[:document_tone]
      expect(doc_tone).to have_key :tones
      expect(doc_tone[:tones]).to be_an Array

      first_tone = doc_tone[:tones].first
      expect(first_tone).to be_a Hash
      expect(first_tone).to have_key :tone_name
      expect(first_tone[:tone_name]).to eq "Joy"
    end
  end
end
