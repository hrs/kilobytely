require 'spec_helper'

describe Codon do
  include Codon

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

  it 'translates back from codons' do
    expect(codon_to_char('1qf4ti7wlazod2')).to eq 'c'
    expect(codon_to_char('sh6vk9ync1qf4t')).to eq '3'
  end
end
