require "spec_helper"

describe CharacterEncoder do
  describe "#hash" do
    it "translates a base-36 character to a 14-character hash" do
      hashed_char = CharacterEncoder.new("c").hash

      expect(hashed_char.to_s.size).to eq 14
      expect(hashed_char).to eq "1qf4ti7wlazod2"
    end

    it "translates integers" do
      hashed_char = CharacterEncoder.new("3").hash

      expect(hashed_char.to_s.size).to eq 14
      expect(hashed_char).to eq "sh6vk9ync1qf4t"
    end
  end

  describe "#unhash" do
    it "translates back from hashed characters" do
      expect(CharacterEncoder.new("1qf4ti7wlazod2").unhash).to eq "c"
      expect(CharacterEncoder.new("sh6vk9ync1qf4t").unhash).to eq "3"
    end
  end

  describe "#valid_hash?" do
    it "determines when a hash is valid" do
      expect(CharacterEncoder.new("sh6vk9ync1qf4t")).to be_valid
    end

    it "determines when a hash is invalid" do
      expect(CharacterEncoder.new("sh6vk9ync1qf4u")).not_to be_valid
    end
  end
end
