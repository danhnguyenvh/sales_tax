class Output

  def initialize items, total_sales_tax, total_amount
    @items = items
    @sales_tax = total_sales_tax
    @total_amount = total_amount
  end
  
  def show_output
    puts "Output: "
    @items.each do |item|
      row_item(item)
    end
    row_sales_tax
    row_total_amount
  end

  def self.show_input(input, filename)
    puts "Input from #{filename}:"
    puts input
    puts "\n"
  end

  private
  def format_decimals number
    number = "%.2f" % number
  end

  def row_item row_item
      row_item[:total] = format_decimals(row_item[:total])
      puts "#{row_item[:qty]}, #{row_item[:name]}, #{row_item[:total]}"
  end

  def row_sales_tax
    @sales_tax = format_decimals(@sales_tax)
    puts "Sales Taxes: #{@sales_tax}"
  end

  def row_total_amount
    @total_amount = format_decimals(@total_amount)
    puts "Total: #{@total_amount}"
  end  
end