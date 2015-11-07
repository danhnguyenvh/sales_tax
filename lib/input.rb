class Input
  attr_reader :input_file, :items
  FREE_TAX = ["book","chocolates","chocolate","pills"]
  def initialize filename
    @input_file = File.open(File.dirname(File.dirname(__FILE__)) + '/input/' + filename).to_a
    @items = []
  end

  def parse
    @input_file.each do |item|
      item = item.strip.split(',')
      tmp_item = { name: item[1],
                   qty: item[0].to_i,
                   price: item[2].to_f,
                   good: is_good(item[1]),
                   import: is_import(item[1]),
                   total: (item[0].to_i * item[2].to_f)
                  }
      @items << tmp_item
    end
    return @items
  end

  private  
  def set_no_tax filename
    no_taxs = File.open(filename).to_a
    no_taxs.map! { |item| item.chomp }
    return no_taxs
  end

  def is_good name
    check_good = name.split(" ") & FREE_TAX
    return check_good.length>0 ? false : true
  end

  def is_import name
    check_import = name.include? 'imported'
    return check_import == true ? true : false
  end
end