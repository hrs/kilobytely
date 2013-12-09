require 'spec_helper'

describe CharacterHash do
  include CharacterHash

  describe :hash do
    it 'translates a base-36 character to a 14-character hash' do
      hashed_char = hash('c')

      expect(hashed_char.to_s.size).to eq 14
      expect(hashed_char).to eq '1qf4ti7wlazod2'
    end

    it 'translates integers' do
      hashed_char = hash('3')

      expect(hashed_char.to_s.size).to eq 14
      expect(hashed_char).to eq 'sh6vk9ync1qf4t'
    end
  end

  describe :unhash do
    it 'translates back from hashed characters' do
      expect(unhash('1qf4ti7wlazod2')).to eq 'c'
      expect(unhash('sh6vk9ync1qf4t')).to eq '3'
    end
  end

  describe :valid_hash? do
    it 'determines when a hash is valid' do
      expect(valid_hash?('sh6vk9ync1qf4t')).to be_true
    end

    it 'determines when a hash is invalid' do
      expect(valid_hash?('sh6vk9ync1qf4u')).to be_false
    end
  end
end
