require 'spec_helper'

describe Codon do
  include Codon

  describe :char_to_codon do
    it 'translates a base-36 character to a 6-character codon' do
      codon = char_to_codon('c')

      expect(codon.to_s.size).to eq 14
      expect(codon).to eq '1qf4ti7wlazod2'
    end

    it 'translates integers' do
      codon = char_to_codon('3')

      expect(codon.to_s.size).to eq 14
      expect(codon).to eq 'sh6vk9ync1qf4t'
    end
  end

  describe :codon_to_char do
    it 'translates back from codons' do
      expect(codon_to_char('1qf4ti7wlazod2')).to eq 'c'
      expect(codon_to_char('sh6vk9ync1qf4t')).to eq '3'
    end
  end

  describe :valid_codon? do
    it 'determines when a codon is valid' do
      expect(valid_codon?('sh6vk9ync1qf4t')).to be_true
    end

    it 'determines when a codon is invalid' do
      expect(valid_codon?('sh6vk9ync1qf4u')).to be_false
    end
  end
end
