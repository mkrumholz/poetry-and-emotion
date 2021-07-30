class ToneAnalyzerService
  def self.analyze_tone(text)
    conn = Faraday.new do |connection|
      connection.basic_auth('apikey', ENV['TONE_API_KEY'])
    end
    response = conn.post("https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/5a8bbc8c-eac6-45b4-8d3f-b0a131148aec/v3/tone") do |req|
      req.params['version'] = '2017-09-21'
      req.headers['Content-Type'] = 'application/json'
      req.body = {text: text}.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
