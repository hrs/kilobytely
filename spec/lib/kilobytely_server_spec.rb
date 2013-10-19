require 'spec_helper'

set :environment, :test

describe KilobytelyServer do
  include Rack::Test::Methods
  include AntiHash

  def app
    KilobytelyServer
  end

  let (:url) { 'http://harryrschwartz.com' }
  let (:encoded_url) { encode(url) }

  describe 'encoding a URL' do
    it 'reads the plaintext URL, returning its encoded value' do
      post '/encode', :url => url

      expect(last_response).to be_ok
      expect(last_response.body).to eq encoded_url
    end
  end

  describe 'decoding a URL' do
    it 'reads the encoded URL as a parameter, redirecting to the right place' do
      get "/#{encoded_url}"

      expect(last_response.status).to eq 302
      expect(last_response.headers['Location']).to eq url
    end
  end
end
