class Encoder
  def initialize(string)
    @string = string
  end

  def encode
    to_base_36(string).chars.map { |c| CharacterEncoder.new(c).hash }.join
  end

  def decode
    encoded_url = hashed_chars(string).map { |c| CharacterEncoder.new(c).unhash }.join
    from_base_36(encoded_url)
  end

  def valid?
    string.size % CharacterEncoder::SIZE == 0 &&
      hashed_chars(string).all? { |c| CharacterEncoder.new(c).valid? }
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
    obfuscated_url.scan(/.{#{CharacterEncoder::SIZE}}/)
  end
end
