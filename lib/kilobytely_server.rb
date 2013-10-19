require 'sinatra'

class KilobytelyServer < Sinatra::Base
  include AntiHash

  error 500 do
    "Oh no, an internal server error!: #{env['sinatra.error'].class}: #{env['sinatra.error'].message}"
  end

  post '/encode' do
    encode(params[:url])
  end

  get '/:encoded_url' do
    redirect decode(params[:encoded_url])
  end
end
