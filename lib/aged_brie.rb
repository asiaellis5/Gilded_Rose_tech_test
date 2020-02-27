module AgedBrie
  def self.update(item)
    item.sell_in -= 1
    if item.quality < 50 && item.sell_in >= 0
      item.quality += 1
    elsif (item.quality + 2) <= 50 && item.sell_in <= 0
      item.quality += 2
    end
  end
end