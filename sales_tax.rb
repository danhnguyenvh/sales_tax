require './lib/input'
require './lib/calculator'
require './lib/output'

class SalesTax
  def initialize(filename)
    @filename = filename
  end

  def process
    input = Input.new(@filename)
    input.parse
    
    calc = Calculator.new(input.items)
    total_amount = calc.total_amount

    Output.show_input(input.input_file, @filename)
    output = Output.new(calc.items, calc.total_sales_tax, total_amount)
    output.show_output
  end
end

filename = ARGV.first
tax = SalesTax.new(filename)
tax.process
