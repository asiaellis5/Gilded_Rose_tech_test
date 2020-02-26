require 'gilded_rose'
require 'item'


describe "Sulfuras" do
  it "updates the quality of Sulfuras correctly" do
    items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
    gilded_rose = GildedRose.new(items)
    5.times{ gilded_rose.update_quality }
    expect(gilded_rose.items[0].quality).to eq 80
  end
end
