# frozen_string_literal: true

require 'fuzzy_compare/version'
require 'moji'

module FuzzyCompare

  def self.equal?(value1, value2)

    def self.normalize(value)
      value = value.gsub(/(う゛|ゔ|ヴ)/, 'ｳﾞ')
      value = Moji.hira_to_kata(value)
      value = Moji.zen_to_han(value)
      value = Moji.downcase(value)
    end

    normalize(value1) == normalize(value2)
  end

end
