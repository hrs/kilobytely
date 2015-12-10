module SymmetricHash
  include CharacterHash

  def to_base_36(str)
    str.unpack("H*").first.to_i(16).to_s(36)
  end

  def from_base_36(str)
    [str.to_i(36).to_s(16)].pack("H*")
  end

  def encode(url)
    to_base_36(url).chars.map { |c| hash(c) }.join
  end

  def decode(obfuscated_url)
    encoded_url = hashed_chars(obfuscated_url).map { |c| unhash(c) }.join
    from_base_36(encoded_url)
  end

  def valid?(obfuscated_url)
    obfuscated_url.size % CharacterHash::SIZE == 0 &&
      hashed_chars(obfuscated_url).all? { |c| valid_hash?(c) }
  end

  def hashed_chars(obfuscated_url)
    obfuscated_url.scan(/.{#{CharacterHash::SIZE}}/)
  end
end
