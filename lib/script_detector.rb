# encoding: UTF-8

require 'lib/chinese_detector.rb'

class String
  include ChineseDetector

  def chinese?
    look_for_chars_in(/\p{Han}/) and !self.japanese? and !self.korean?
  end

  def traditional_chinese?
    look_for_chars_in traditional_chinese_regex
  end

  def simplified_chinese?
    look_for_chars_in simplified_chinese_regex
  end

  def japanese?
    look_for_chars_in /(\p{Katakana}|\p{Hiragana})/
  end

  def korean?
    look_for_chars_in /\p{Hangul}/
  end

  private

  def look_for_chars_in regex
    !! (self =~ regex)
  end
end
