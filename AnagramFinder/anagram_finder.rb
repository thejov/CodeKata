class AnagramFinder

  def self.anagram?(first_word, second_word)
    first = first_word.split(//).sort
    second = second_word.split(//).sort
    first.eql?(second)
  end

  def self.find_anagrams(word_array)
    anagrams_array = []

    word_array.each do |word|
      next if anagrams_array.flatten.include?(word)

      same_length_words = word_array.select { |w| w.length == word.length }
      anagrams = find_anagrams_for(word, same_length_words)
      anagrams_array << anagrams if anagrams.size > 1
    end

    anagrams_array.uniq
  end

  def self.find_anagrams_for(word, word_array)
    word_array.select do |other_word|
      anagram?(word, other_word)
    end
  end

  def self.find_anagrams_from_text(word_list_text)
    find_anagrams(word_list_text.split("\n")).map { |row| row.join(' ') }.join("\n")
  end

end