require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  items = [
    Item.new(name="Normal item", sell_in=1, quality=10),
    Item.new(name="Normal item", sell_in=0, quality=20),
    Item.new(name="Normal item", sell_in=-1, quality=1),
  ]
  GildedRose.new(items).update_quality()

  describe "#update_quality" do
    # Normal item tests
    it "Normal items quality decrese by 1 if sell_in > 0" do
      expect(items[0].quality).to eq 9
    end
    it "Normal items quality decrese by 2 if sell_in <= 0" do
      expect(items[1].quality).to eq 18
    end
    it "Normal items quality decrese by 2 if sell_in <= 0 and the quality doesn't become negative" do
      expect(items[2].quality).to eq 0
    end

  end

end
