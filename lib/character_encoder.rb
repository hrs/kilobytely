class CharacterEncoder
  SIZE = 14

  def initialize(string)
    @string = string
  end

  def hash
    (1..SIZE).map do |mult|
      offset = mult * CHAR_OFFSET
      encoded_char = (offset + string.to_i(BASE)) % BASE
      encoded_char.to_s(BASE)
    end.join
  end

  def unhash
    # the whole "code" is really redundant, so the original character
    # can be derived from the first character of the hash
    ((string.chars.first.to_i(BASE) - CHAR_OFFSET) % BASE).to_s(BASE)
  end

  def valid?
    string.size == SIZE && string == CharacterEncoder.new(unhash).hash
  end

  private

  attr_reader :string

  # ensure that gcd(CHAR_OFFSET, BASE) == 1
  CHAR_OFFSET = 25
  BASE = 36
end
