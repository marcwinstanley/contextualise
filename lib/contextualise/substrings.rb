module Contextualise
  class Substrings
    attr_reader :text_input
    private :text_input

    def initialize(args)
      @text_input = args[:text_input]
    end

    def self.identify(args)
      new(args).identify
    end

    def identify
      #identified_substrings.uniq
      words
    end

    private

    def words
      text_input.split(' ')
    end

    def phrase_length
      4
    end

    def all_substrings(search=words)
      if search.empty?
        [[]]
      else
        max = 1..[phrase_length, search.length].min

        max.map { |index|
          all_substrings(search[index..-1]).map { |substring|
            [search[0, index].join(' ')] + substring
          }
        }.inject(&:+)
      end
    end

    def identified_substrings
      all_substrings.flatten
    end
  end
end
