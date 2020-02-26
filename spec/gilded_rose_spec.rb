require 'gilded_rose'
require 'item'

describe GildedRose do

  items = [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49)
  ]

  let(:subject){described_class.new(items)}
  
  describe "#update_quality" do
    it "does not change the name" do
      subject.update_quality
      expect(subject.items[0].name).to eq "+5 Dexterity Vest"
    end
  end
end