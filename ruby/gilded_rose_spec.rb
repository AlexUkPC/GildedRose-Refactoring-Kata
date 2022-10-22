require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  items = [
    Item.new(name="Normal item", sell_in=1, quality=10),
    Item.new(name="Normal item", sell_in=0, quality=20),
    Item.new(name="Normal item", sell_in=-1, quality=1),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Aged Brie", sell_in=0, quality=10),
    Item.new(name="Aged Brie", sell_in=-1, quality=49),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)
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
    # Aged Brie tests
    it "Aged Brie quality increases by 1 if sell_in > 0" do
      expect(items[3].quality).to eq 1
    end
    it "Aged Brie quality increases by 2 if sell_in <= 0" do
      expect(items[4].quality).to eq 12
    end
    it "Aged Brie quality increases by 2 if sell_in <= 0 and the quality increase above 50" do
      expect(items[5].quality).to eq 50
    end
    # Sulfuras tests
    it "Sulfuras quality doesn't change" do
      expect(items[6].quality).to eq 80
    end
    it "Sulfuras quantity doesn't change" do
      expect(items[7].sell_in).to eq -1
    end
  end

end
