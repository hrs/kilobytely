require 'spec_helper'

set :environment, :test

describe KilobytelyServer do
  include Rack::Test::Methods
  include SymmetricHash

  def app
    KilobytelyServer
  end

  let (:sample_url) { 'http://harryrschwartz.com' }
  let (:encoded_url) { encode(sample_url) }

  describe 'getting the front page' do
    it 'retrieves a page' do
      get '/'

      expect(last_response).to be_ok
    end

    it 'retrieves a page with an encoded url' do
      get '/', url: encoded_url

      expect(last_response).to be_ok
    end
  end

  describe 'decoding a URL' do
    it 'reads the encoded URL as a parameter, redirecting to the right place' do
      get "/#{encoded_url}"

      expect(last_response.status).to eq 302
      expect(last_response.headers['Location']).to eq sample_url
    end

    it 'returns a 400 if the encoded URL looks invalid' do
      get "/#{encoded_url.gsub('a', 'b')}"

      expect(last_response.status).to eq 400
    end
  end
end
