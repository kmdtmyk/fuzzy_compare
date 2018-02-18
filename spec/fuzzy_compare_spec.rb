RSpec.describe FuzzyCompare do

  it 'has a version number' do
    expect(FuzzyCompare::VERSION).not_to be nil
  end

  describe '#equal?' do

    it 'alphabet' do
      expect(FuzzyCompare.equal?('abc', 'abc')).to be_truthy
      expect(FuzzyCompare.equal?('abc', 'ABC')).to be_truthy
      expect(FuzzyCompare.equal?('abc', 'ａｂｃ')).to be_truthy
      expect(FuzzyCompare.equal?('abc', 'ＡＢＣ')).to be_truthy
    end

    it 'number' do
      expect(FuzzyCompare.equal?('0123456789', '０１２３４５６７８９')).to be_truthy
    end

    it 'japanese' do
      expect(FuzzyCompare.equal?('あいうえお', 'アイウエオ')).to be_truthy
      expect(FuzzyCompare.equal?('あいうえお', 'ｱｲｳｴｵ')).to be_truthy
      expect(FuzzyCompare.equal?('がぎぐげご', 'ｶﾞｷﾞｸﾞｹﾞｺﾞ')).to be_truthy
    end

    it 'symbol' do
      expect(FuzzyCompare.equal?('@', '＠')).to be_truthy
      expect(FuzzyCompare.equal?('%', '％')).to be_truthy
      expect(FuzzyCompare.equal?('()', '（）')).to be_truthy
      expect(FuzzyCompare.equal?('{}', '｛｝')).to be_truthy
    end

    it 'vu' do
      expect(FuzzyCompare.equal?('ヴ', 'ゔ')).to be_truthy
      expect(FuzzyCompare.equal?('ヴ', 'う゛')).to be_truthy
      expect(FuzzyCompare.equal?('ヴ', 'ｳﾞ')).to be_truthy
    end

    it 'composition' do
      expect(FuzzyCompare.equal?('これはペンとbookです!', 'コレハﾍﾟﾝとBOOKデス！')).to be_truthy
    end

  end

end
