module BackStagePass
  def self.update(item)
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
end