class Encoder
  include CharacterHash

  def initialize(string)
    @string = string
  end

  def encode
    to_base_36(string).chars.map { |c| hash(c) }.join
  end

  def decode
    encoded_url = hashed_chars(string).map { |c| unhash(c) }.join
    from_base_36(encoded_url)
  end

  def valid?
    string.size % CharacterHash::SIZE == 0 &&
      hashed_chars(string).all? { |c| valid_hash?(c) }
  end

  private

  attr_reader :string

  def to_base_36(str)
    str.unpack("H*").first.to_i(16).to_s(36)
  end

  def from_base_36(str)
    [str.to_i(36).to_s(16)].pack("H*")
  end

  def hashed_chars(obfuscated_url)
    obfuscated_url.scan(/.{#{CharacterHash::SIZE}}/)
  end
end
