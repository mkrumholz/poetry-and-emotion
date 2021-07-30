class ToneAnalyzerFacade 
  def self.analyze(text)
    response = ToneAnalyzerService.analyze_tone(text)
    tones = response[:document_tone][:tones].map do |tone|
      tone[:tone_name]
    end.join(', ')
  end
end
