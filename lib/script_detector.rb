# encoding: UTF-8

require File.dirname(__FILE__) + '/chinese_detector.rb'

class String
  include ChineseDetector

  # Returns true if the string contains Chinese characters _and_ no Japanese or Korean characters
  def chinese?
    look_for_chars_in(/\p{Han}/) and !self.japanese? and !self.korean?
  end

  # Return true if the string contains traditional Chinese characters (繁體字)
  def traditional_chinese?
    look_for_chars_in traditional_chinese_regex
  end

  # Return true if the string contains simplified Chinese characters (简体字)
  def simplified_chinese?
    look_for_chars_in simplified_chinese_regex
  end

  # Returns true if the string contains specifically Japanese (hiragana or katakana) characters
  def japanese?
    look_for_chars_in /(\p{Katakana}|\p{Hiragana})/
  end

  # Returns true if the string contains specifically Korean (hangul) characters
  def korean?
    look_for_chars_in /\p{Hangul}/
  end

  # Try to detect script and return one of "Japanese", "Korean", "Traditional Chinese", "Simplified Chinese", "Ambiguous Chinese" or "Unknown"
  def identify_script
    return "Japanese" if self.japanese?
    return "Korean" if self.korean?
    return "Traditional Chinese" if self.traditional_chinese?
    return "Simplified Chinese" if self.simplified_chinese?
    return "Ambiguous Chinese" if self.chinese?
    "Unknown"
  end

  private

  def look_for_chars_in regex
    !! (self =~ regex)
  end
end
