module Codon
  SIZE = 14

  # ensure that gcd(CHAR_OFFSET, BASE) == 1
  CHAR_OFFSET = 25
  BASE = 36

  # map a single character to a string of `SIZE` random-looking
  # characters.
  def char_to_codon(char)
    (1..SIZE).map { |mult|
      offset = mult * CHAR_OFFSET
      encoded_char = (offset + char.to_i(BASE)) % BASE
      encoded_char.to_s(BASE)
    }.join
  end

  # take a string of length `SIZE` and return the original character
  # it was derived from
  def codon_to_char(codon)
    # the whole "code" is really redundant, so the original character
    # can be derived from the first character of the codon
    ((codon.chars.first.to_i(BASE) - CHAR_OFFSET) % BASE).to_s(BASE)
  end

  def valid_codon?(codon)
    codon.size == SIZE &&
      codon == char_to_codon(codon_to_char(codon))
  end
end
