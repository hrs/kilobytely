module Codon
  MAGIC_CODON_CODES = [4, 29, 6, 12, 9, 24, 14]
  SIZE = MAGIC_CODON_CODES.size

  def char_to_codon(char)
    MAGIC_CODON_CODES.map {|code|
      offset_char = (code + char.to_i(36)) % 36
      offset_char.to_s(36)
    }.join
  end

  def codon_to_char(codon)
    # this code's really redundant, so the character can be derived
    # from the first character of the codon
    ((codon.chars.first.to_i(36) - MAGIC_CODON_CODES.first) % 36).to_s(36)
  end
end
