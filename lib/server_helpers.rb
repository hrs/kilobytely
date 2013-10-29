module ServerHelpers
  include AntiHash

  SERVER_URL = 'http://kilobytely.com/'

  def prefix_http_if_needed(url)
    if url =~ /:\/\//
      url
    else
      'http://' + url
    end
  end

  def encode_url_to_kilobytely(url)
    if url && !url.empty?
      url = prefix_http_if_needed(url)
      SERVER_URL + encode(url)
    end
  end
end
