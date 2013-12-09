require 'haml'
require 'sinatra'

class KilobytelyServer < Sinatra::Base
  include SymmetricHash

  configure do
    set :root, File.join(File.dirname(__FILE__), '..')
  end

  error 400 do
    'That URL looks invalid. Sorry. =('
  end

  error 500 do
    'Oh no, an internal server error! What have you done?!'
  end

  get '/' do
    encoded_url = params[:url] && url + encode(params[:url])
    haml :index, locals: { encoded_url: encoded_url }
  end

  get '/:encoded_url' do
    if valid?(params[:encoded_url])
      redirect decode(params[:encoded_url])
    else
      400
    end
  end
end
