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
  end
end
