# Amazon has a list of products to show in product discovery widget.
# The widget needs to maintain a list, which you can add, remove, or randomly get one product. 
# How can you achieve this?

# backend service gives us list 
# local copy resides in client
# return product_id for getter

class List
  def initialize
    HTTPCLIENT.get('backend_service')
    @list = []
    @hash = {}
  end

  def add(product_id)
    @list.insert(product_id) # append
    @hash[product_id] = @list.index(product_id)
  end

  def remove(product_id)
    @list.delete(product_id)
    @hash.delete(product_id)
  end

  def random_product
    random = rand()*@list.size
    @list.index(random)
  end
end

l = List.new()
l.add(567)
l.remove(567)
l.random_product

l.add('one')
l[0] == 'one'