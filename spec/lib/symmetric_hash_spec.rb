require "spec_helper"

describe SymmetricHash do
  include SymmetricHash

  def url
    "http://harryrschwartz.com"
  end

  describe "#to_base_36" do
    it "converts a string to base 36" do
      base_36_str = to_base_36(url)
      base_36_chars = ("0".."9").to_a + ("a".."z").to_a

      base_36_str.each_char do |c|
        expect(base_36_chars).to include c
      end
    end
  end

  describe "#from_base_36" do
    it "translates a base-36 string back to \"normal\"" do
      expect(from_base_36(to_base_36(url))).to eq url
    end
  end

  describe "#encode" do
    it "converts to something significantly longer" do
      expect(encode(url).size).to be > url.size * 10
    end
  end

  describe "#decode" do
    it "converts from encode input" do
      expect(decode(encode("foo"))).to eq "foo"
    end
  end

  describe "#valid?" do
    it "recognizes valid input" do
      # "foo"
      expect(valid?("0pe3sh6vk9ync1qf4ti7wlazod2rg5uj8xmb0pe3sh")).to be_true
    end

    it "recognizes invalid input" do
      expect(valid?("0pe3sh6vk9ync1qf4ti8wlazod2rg5uj8xmb0pe3sh")).to be_false
    end
  end
end
