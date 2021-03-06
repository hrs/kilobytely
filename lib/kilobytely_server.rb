require "sinatra"

class KilobytelyServer < Sinatra::Base
  configure do
    set :root, File.join(File.dirname(__FILE__), "..")
  end

  error 400 do
    "That URL looks invalid. Sorry. =("
  end

  error 500 do
    "Oh no, an internal server error! What have you done?!"
  end

  get "/" do
    erb :index, locals: { encoded_url: encoded_url(params[:url]) }
  end

  get "/:encoded_url" do
    url_encoder = Encoder.new(params[:encoded_url])
    if url_encoder.valid?
      redirect url_encoder.decode
    else
      400
    end
  end

  private

  def encoded_url(url_param)
    if url_param
      url + Encoder.new(url_param).encode
    end
  end
end
