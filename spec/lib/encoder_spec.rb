require "spec_helper"

describe Encoder do
  def url
    "http://harryrschwartz.com"
  end

  describe "#encode" do
    it "converts to something significantly longer" do
      expect(Encoder.new(url).encode.size).to be > url.size * 10
    end
  end

  describe "#decode" do
    it "converts from encode input" do
      expect(Encoder.new(Encoder.new("foo").encode).decode).to eq "foo"
    end
  end

  describe "#valid?" do
    it "recognizes valid input" do
      foo_encoder = Encoder.new("0pe3sh6vk9ync1qf4ti7wlazod2rg5uj8xmb0pe3sh")
      expect(foo_encoder).to be_valid
    end

    it "recognizes invalid input" do
      nonsense_encoder = Encoder.new("0pe3sh6vk9ync1qf4ti8wlazod2rg5uj8xmb0pe3sh")
      expect(nonsense_encoder).not_to be_valid
    end
  end
end
