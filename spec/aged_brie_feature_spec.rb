require 'gilded_rose'
require 'item'

describe "Aged Brie" do
  it "updates correctly for 'Aged Brie'" do
    items = [Item.new(name="Aged Brie", sell_in=10, quality=20)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].name).to eq "Aged Brie"
    expect(gilded_rose.items[0].sell_in).to eq 9
    expect(gilded_rose.items[0].quality).to eq 21
  end
  
  it "doesnt let the quality of an item go above 50" do
    items = [Item.new(name="Aged Brie", sell_in=10, quality=50)]
    gilded_rose = GildedRose.new(items)
    10.times{ gilded_rose.update_quality }
    expect(gilded_rose.items[0].quality).to eq 50
  end

  it "increase the quality of brie by two after sell in date" do
    items = [Item.new(name="Aged Brie", sell_in=5, quality=40)]
    gilded_rose = GildedRose.new(items)
    6.times{ gilded_rose.update_quality }
    expect(gilded_rose.items[0].quality).to eq 47
  end
end
