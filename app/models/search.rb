class Search
  attr_reader :term

 def initialize(option = {})
  @term = option.fetch(:term, "")
 end

 def to_partial_path
  "searches/search"
 end

 def products
  Product.where("name LIKE ?", search_term)
 end

 def found?(term)
  products.each do |p|
    if(p.name != "%#{term}%")
      return false
      break
    end
  end
 end

private
  def search_term
    "%#{term}%"
  end

end

