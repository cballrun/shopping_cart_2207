require './lib/product'
require './lib/shopping_cart'

RSpec.describe Cart do

  it 'exists' do
    cart = Cart.new("King Soopers", "30items")
    
    expect(cart).to be_a(Cart)
  end

  it 'instantiates with the expected attributes' do
    cart = Cart.new("King Soopers", "30items")

    expect(cart.name).to eq("King Soopers")
    expect(cart.capacity).to eq(30)
    expect(cart.products).to eq([])
  end

  it 'can add products' do 
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products.length).to eq(2)
  end

  it 'can output cart details as a hash' do
    cart = Cart.new("King Soopers", "30items")
    
    expect(cart.details).to eq({name: "King Soopers", capacity: 30})
  end

  it 'can count the total quantity of products in it' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    expect(cart.total_number_of_products).to eq(13)
  end

  it 'can tell if it is full' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    expect(cart.is_full?).to eq(false)
    cart.add_product(product4)

    expect(cart.is_full?).to eq(true)
  end

  it 'can return products by category' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    expect(cart.products_by_category(:paper).length).to eq(2)
  end

  it 'can tell what percentage of it is occupied' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    

    expect(cart.percentage_occupied).to eq(43.33)
  end

  it 'can sort products by quantity' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
    
    expect(cart.sorted_products_by_quantity).to eq([1, 2, 10, 20])
  end

  it 'can create a hash of products by category' do
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)
   
    expect(cart.product_breakdown.count).to eq(3)
  end




end