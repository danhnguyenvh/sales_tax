require_relative "../lib/output"

describe "Output" do
  it "should display the items inline" do
    items = [ { name: "imported bottle of chocolates", qty: 1, price: 10.00, good: false, import: true, total: 10.50 },
              { name: "imported bottle of perfume", qty: 1, price: 47.50, good: true, import: true, total: 54.65 }
            ]
    total_sales_tax = 7.65
    total_amount = 65.15
    output = Output.new(items, total_sales_tax, total_amount)
    output.show_output
  end
end