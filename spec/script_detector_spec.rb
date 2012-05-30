# encoding: UTF-8

require 'helper'

describe 'Script detection for' do
  describe 'Simplified Chinese text' do
    before do
      @chinese_simpl = ' 我的气垫船充满了鳝鱼.'
    end

    it 'is Chinese' do
      @chinese_simpl.should be_chinese
    end

    it 'is simplified Chinese' do
      @chinese_simpl.should be_simplified_chinese
    end

    it 'is not traditional Chinese' do
      @chinese_simpl.should_not be_traditional_chinese
    end

    it 'is not Japanese' do
      @chinese_simpl.should_not be_japanese
    end

    it 'is identified as Simplified Chinese' do
      @chinese_simpl.identify_script.should == "Simplified Chinese"
    end
  end

  describe 'Traditional Chinese text' do
    before do
      @chinese_trad = ' 我的氣墊船充滿了鱔魚.'
    end

    it 'is Chinese' do
      @chinese_trad.should be_chinese
    end

    it 'is traditional Chinese' do
      @chinese_trad.should be_traditional_chinese
    end

    it 'is not simplified Chinese' do
      @chinese_trad.should_not be_simplified_chinese
    end

    it 'is not Japanese' do
      @chinese_trad.should_not be_japanese
    end

    it 'is identified as traditional Chinese' do
      @chinese_trad.identify_script.should == "Traditional Chinese"
    end
  end

  describe 'Ambiguous Chinese text' do
    before do
      @chinese_amb = '你好.'
    end

    it 'is Chinese' do
      @chinese_amb.should be_chinese
    end

    it 'is neither traditional nor simplified Chinese' do
      @chinese_amb.should_not be_simplified_chinese
      @chinese_amb.should_not be_traditional_chinese
    end

    it 'is identified as ambiguous Chinese' do
      @chinese_amb.identify_script.should == "Ambiguous Chinese"
    end
  end

  describe 'Japanese text' do
    before do
      @japanese = ' 私のホバークラフトは鰻でいっぱいです.'
    end

    it 'is Japanese' do
      @japanese.should be_japanese
    end

    it 'is not Chinese or Korean' do
      @japanese.should_not be_chinese
      @japanese.should_not be_korean
    end

    it 'is identified as Japanese' do
      @japanese.identify_script.should == "Japanese"
    end
  end

  describe 'Korean text' do
    before do
      @korean = ' 내 호버크라프트는 장어로 가득 차 있어요.'
    end

    it 'is Korean' do
      @korean.should be_korean
    end

    it 'is not Chinese or Japanese' do
      @korean.should_not be_chinese
      @korean.should_not be_japanese
    end

    it 'is identified as Korean' do
      @korean.identify_script.should == "Korean"
    end
  end

  describe 'Non-CJK text' do
    before do
      @unknown = 'Hello world.'
    end

    it 'is none of the above' do
      @unknown.should_not be_chinese
      @unknown.should_not be_simplified_chinese
      @unknown.should_not be_traditional_chinese
      @unknown.should_not be_japanese
      @unknown.should_not be_korean
    end

    it 'is identified as unknown' do
      @unknown.identify_script.should == "Unknown"
    end
  end
end
