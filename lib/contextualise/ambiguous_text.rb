module Contextualise
  class AmbiguousText
    attr_reader :text_input
    private :text_input

    def initialize(args)
      @text_input = args['text_input']
    end

    def self.add_context(args)
      new(args).add_context
    end

    def add_context
      substrings
    end

    def identify_keyterms

    end

    def substrings
      @substrings ||= Substrings.identify(text_input: text_input)
    end
  end
end
