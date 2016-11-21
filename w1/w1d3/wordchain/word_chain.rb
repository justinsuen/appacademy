require 'set'

class WordChainer
  attr_reader :dictionary, :current_words, :all_seen_words

  def initialize(dictionary_file_name, source, _)
    @dictionary = get_dictionary(dictionary_file_name)
    @current_words = [source]
    @all_seen_words = { source => nil }
  end

  def get_dictionary(dictionary_file_name)
    File.readlines(dictionary_file_name).map(&:chomp).to_set
  end

  def adjacent_words(target)
    poss_words = @dictionary.select { |w| w.length == target.length }
    filter_adj(poss_words, target)
  end

  def build_path(target)
    path = [target]
    until target == nil
      path << @all_seen_words[target]
      target = @all_seen_words[target]
    end
    p path[0..-2]
  end

  def filter_adj(words, target)
    adj_words = []

    words.each do |word|
      diff = 0
      word.each_char.with_index do |c, i|
        diff += 1 if c != target[i]
      end
      adj_words << word if diff == 1
    end

    adj_words
  end

  def run(_, target)
    until @current_words.empty?
      new_current_words = {}

      current_words.each do |current_word, _|
        new_adj_words = explore_current_words(current_word)

        new_current_words.merge!(new_adj_words)
        @all_seen_words.merge!(new_adj_words)
        break if is_close?(target)
      end

      @current_words = new_current_words
    end

    build_path(target)
  end

  def is_close?(target)
    @all_seen_words.key?(target)
  end

  def explore_current_words(current_word)
    res = {}
    adjacent_words(current_word).each do |adj_word|
      unless @all_seen_words.key?(adj_word)
        @all_seen_words[adj_word] = current_word
        res[adj_word] = current_word
      end
    end

    res
  end
end

if $PROGRAM_NAME == __FILE__
  word_chainer = WordChainer.new(*ARGV)
  word_chainer.run(ARGV[1], ARGV[2])
end
