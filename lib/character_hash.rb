module CharacterHash
  SIZE = 14

  # ensure that gcd(CHAR_OFFSET, BASE) == 1
  CHAR_OFFSET = 25
  BASE = 36

  def hash(char)
    (1..SIZE).map { |mult|
      offset = mult * CHAR_OFFSET
      encoded_char = (offset + char.to_i(BASE)) % BASE
      encoded_char.to_s(BASE)
    }.join
  end

  def unhash(hashed_char)
    # the whole "code" is really redundant, so the original character
    # can be derived from the first character of the hash
    ((hashed_char.chars.first.to_i(BASE) - CHAR_OFFSET) % BASE).to_s(BASE)
  end

  def valid_hash?(hashed_char)
    hashed_char.size == SIZE &&
      hashed_char == hash(unhash(hashed_char))
  end
end
