require 'sinatra'

class KilobytelyServer < Sinatra::Base
  include AntiHash

  URL = "http://kilobytely.herokuapp.com/"

  set :root, File.join(File.dirname(__FILE__), '..')

  helpers do
    def encode_url_to_kilobytely(url)
      if url && !url.empty?
        URL + encode(url)
      end
    end
  end

  error 500 do
    "Oh no, an internal server error!: #{env['sinatra.error'].class}: #{env['sinatra.error'].message}"
  end

  get '/' do
    encoded_url = encode_url_to_kilobytely(params[:url])
    haml :index, locals: { encoded_url: encoded_url }
  end

  get '/:encoded_url' do
    redirect decode(params[:encoded_url])
  end
end
