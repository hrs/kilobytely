require 'spec_helper'

describe ServerHelpers do
  include AntiHash
  include ServerHelpers

  describe :prefix_url_if_needed do
    it 'adds "http://" if not included' do
      expect(prefix_http_if_needed('foo.com')).to eq 'http://foo.com'
    end

    it 'does nothing if the url already has a protocol' do
      expect(prefix_http_if_needed('ftp://foo.com')).to eq 'ftp://foo.com'
    end
  end

  describe :encode_url_to_kilobytely do
    it 'returns nil given an empty string' do
      expect(encode_url_to_kilobytely('')).to be_nil
    end

    it 'encodes a url correctly' do
      expect(encode_url_to_kilobytely('foo.com')).to eq "http://kilobytely.herokuapp.com/#{encode('http://foo.com')}"
    end
  end
end
