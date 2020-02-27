require 'gilded_rose'
require 'item'

describe "#Conjured" do
  it "degrades in quality twice as fast when sell in above 0" do
    items = [Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].quality).to eq 4
  end

  it "degrades in quality twice as fast when sell in below 0" do
    items = [Item.new(name = 'Conjured Mana Cake', sell_in = 0, quality = 6)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].quality).to eq 2
  end
end