# frozen_string_literal: true

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        update_aged_brie(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        update_back_stagepass(item)
      elsif item.name == 'Sulfuras, Hand of Ragnaros'
        update_sulfuras(item)
      elsif item.name == 'Conjured Mana Cake'
        update_conjured(item)
      else
        update_other_item(item)
      end
    end
  end


  private

  def update_aged_brie(item)
    item.sell_in -= 1 
    if item.quality < 50 && item.sell_in >= 0
      item.quality += 1 
    elsif (item.quality + 2) <= 50 && item.sell_in <= 0
      item.quality += 2
    end
  end

  def update_back_stagepass(item)
    item.sell_in -= 1
    unless item.quality <= 0
      if item.sell_in < 0
        item.quality -= item.quality
      elsif item.sell_in < 6
        item.quality += 3
      elsif item.sell_in < 11
        item.quality += 2
      end
    end
  end

  def update_sulfuras(item)
    item.sell_in -= 1
  end

  def update_other_item(item)
    item.sell_in -= 1 
    unless item.quality <= 0
      if item.sell_in >= 0
        item.quality -= 1
      else
        item.quality -= 2
      end
    end
    end

    def update_conjured(item)
      item.sell_in -= 1
      unless item.quality <= 0
        if item.sell_in >= 0
          item.quality -= 2
        else
          item.quality -= 4
        end
      end
    end
end
