# frozen_string_literal: true
require 'aged_brie'
require 'backstage_pass'
require 'sulfuras'
require 'conjured'
require 'normal_item'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == 'Aged Brie'
        AgedBrie.update(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        BackStagePass.update(item)
      elsif item.name == 'Sulfuras, Hand of Ragnaros'
        Sulfuras.update(item)
      elsif item.name == 'Conjured Mana Cake'
        Conjured.update(item)
      else
        NormalItem.update(item)
      end
    end
  end  
end
