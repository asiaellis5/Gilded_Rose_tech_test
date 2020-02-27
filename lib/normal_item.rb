module NormalItem

  def self.update(item)
    update_sell_in(item)
    unless item.quality <= 0
      update_quality(item)
    end
  end

  private

  def self.update_quality(item)
    item.sell_in >= 0 ? item.quality -= 1 : item.quality -= 2
  end

  def self.update_sell_in(item)
    item.sell_in -= 1
  end

end