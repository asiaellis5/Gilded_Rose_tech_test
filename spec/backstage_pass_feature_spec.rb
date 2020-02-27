# frozen_string_literal: true

require 'gilded_rose'
require 'item'

describe '#backstage pass' do
  it 'updates the quality of backstage passes 10 days before event' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 20)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].quality).to eq 22
  end

  it 'updates the quality of backstage passes 5 days before event' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 4, quality = 30)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].quality).to eq 33
  end

  it 'drops the quality of a backstage pass to 0 after the event' do
    items = [Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 0, quality = 30)]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality
    expect(gilded_rose.items[0].quality).to eq 0
  end
end
