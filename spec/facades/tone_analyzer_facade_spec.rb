require 'rails_helper'

RSpec.describe ToneAnalyzerFacade do
  it 'returns a string of tones for the text' do
    text = "Death! that struck when I was most confiding In my certain faith of joy to be - Strike again, Time's withered branch dividing From the fresh root of Eternity!"

    tones = ToneAnalyzerFacade.analyze(text)

    expect(tones).to eq "Joy, Confident"
  end
end
