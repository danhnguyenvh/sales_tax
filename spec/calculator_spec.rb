require_relative '../lib/calculator'

describe "Calculator" do

  it "should add the good with tax calculated" do
    items = [ { name: "imported bottle of chocolates", qty: 1, price: 10.00, good: false, import: true, total: 10.00 },
              { name: "imported bottle of perfume", qty: 1, price: 47.50, good: true, import: true, total: 47.50 }
            ]
    receipt = Calculator.new(items)
    receipt.total_amount

    receipt.items[0][:total].should == 10.50
    receipt.total_sales_tax.should == 7.65
    receipt.total_amount.should == 65.15
  end
end