require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "update_quality" do
    it "updates quality for non special items" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(gilded_rose.items[0].name).to eq "+5 Dexterity Vest"
      expect(gilded_rose.items[0].sell_in).to eq 9
      expect(gilded_rose.items[0].quality).to eq 19
    end

    it "decreases the sell_in date" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality
      expect(gilded_rose.items[0].sell_in).to eq 9
    end

    it "Quality degrades twice as fast after the sell_in date" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=2, quality=20)]
      gilded_rose = GildedRose.new(items)
      5.times{ gilded_rose.update_quality }
      expect(gilded_rose.items[0].quality).to eq 12
    end

    it "doesnt allow the quality of an item to go below 0" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=2, quality=2)]
      gilded_rose = GildedRose.new(items)
      5.times{ gilded_rose.update_quality }
      expect(gilded_rose.items[0].quality).to eq 0
    end
  end
  
end

