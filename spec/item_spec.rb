# frozen_string_literal: true

require 'item'

describe Item do
  describe '#to_s' do
    it 'turns the item into a string' do
      item = Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 20)
      expect(item.to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 10, 20'
    end
  end
end
