module AntiHash
  include Codon

  def to_base_36(str)
    str.unpack('H*').first.to_i(16).to_s(36)
  end

  def from_base_36(str)
    [str.to_i(36).to_s(16)].pack('H*')
  end

  def encode(url)
    to_base_36(url).chars.map {|c|
      char_to_codon(c)
    }.join
  end

  def decode(obfuscated_url)
    encoded_url = codons(obfuscated_url).map { |c| codon_to_char(c) }.join
    from_base_36(encoded_url)
  end

  def codons(obfuscated_url)
    obfuscated_url.scan(/.{#{Codon::SIZE}}/)
  end

  def valid?(obfuscated_url)
    obfuscated_url.size % Codon::SIZE == 0 &&
      codons(obfuscated_url).all? { |c| valid_codon?(c) }
  end
end
