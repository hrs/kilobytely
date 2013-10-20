require 'haml'
require 'sinatra'

class KilobytelyServer < Sinatra::Base
  include AntiHash

  URL = 'http://kilobytely.herokuapp.com/'

  set :root, File.join(File.dirname(__FILE__), '..')

  def prefix_http_if_needed(url)
    if url =~ /:\/\//
      url
    else
      'http://' + url
    end
  end

  def encode_url_to_kilobytely(url)
    url = prefix_http_if_needed(url)
    if url && !url.empty?
      URL + encode(url)
    end
  end

  error 500 do
    'Oh no, an internal server error! What have you done?!'
  end

  get '/' do
    encoded_url = params[:url] && encode_url_to_kilobytely(params[:url])
    haml :index, locals: { encoded_url: encoded_url }
  end

  get '/:encoded_url' do
    redirect decode(params[:encoded_url])
  end
end
