class Calculator

  attr_reader :items, :total_sales_tax

  def initialize(items_input)
    @items = items_input
    @goods_tax = 0.1
    @import_tax = 0.05
    @total_sales_tax = 0
  end
  
  def total_amount
    prices = @items.map { |item| item[:price] }
    total_price = prices.inject(:+)
    @total_sales_tax = calc_goods_tax + calc_import_tax
    total_amount = total_price + @total_sales_tax
  end

  private
  def round_tax tax
    (tax/0.05).ceil*0.05
  end

  def calc_goods_tax
    total_goods_tax = 0
    goods = @items.select { |item| item[:good] == true }
    goods.each do |good|
      tax = round_tax(good[:price] * good[:qty] * @goods_tax)
      good[:total] += tax
      total_goods_tax += tax
    end
    return total_goods_tax
  end

  def calc_import_tax
    total_import_tax = 0
    goods = @items.select { |item| item[:import] == true }
    goods.each do |good|
      tax = round_tax(good[:price] * good[:qty] * @import_tax)
      good[:total] += tax
      total_import_tax += tax
    end
    return total_import_tax
  end 
end