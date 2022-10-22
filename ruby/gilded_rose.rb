class GildedRose

  def initialize(items)
    @items = items
  end

  def adjustQuality(item, adjustment)
    item.quality = item.quality + adjustment
  end

  def adjustSellIn(item, adjustment)
    item.sell_in = item.sell_in + adjustment
  end

  def updateBrie(item)
    if item.quality < 50
      adjustQuality(item, 1)
    end
    adjustSellIn(item, -1)
    if item.sell_in < 0 && item.quality < 50
      adjustQuality(item, 1)
    end
  end

  def updateBackstage(item)
    if item.quality < 50
      adjustQuality(item, 1)
      if item.sell_in < 11 && item.quality < 50
        adjustQuality(item, 1)
      end
      if item.sell_in < 6 && item.quality < 50
        adjustQuality(item, 1)
      end
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      adjustQuality(item, -item.quality)
    end
  end
  
  def updateSulfuras(item)
    
  end

  def updateNormal(item)
    if item.quality > 0
      adjustQuality(item, -1)
    end
    adjustSellIn(item, -1)
    if item.sell_in < 0 && item.quality > 0
      adjustQuality(item, -1)
    end
  end
  
  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        updateBrie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        updateBackstage(item)
      when "Sulfuras, Hand of Ragnaros"
        updateSulfuras(item)
      else
        updateNormal(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
