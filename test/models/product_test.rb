require 'test_helper'
#在controllerdir下的是integration集成测试
#这里的testcase 是单元测试

#重要，如果在fixtures/products.yml 中定义完数据，默认将在每次调用rails test时将testdb中的数据擦除并重置为所有的定义数据
#因为test_helper.rb 被require进来了，TestCase的实例被全部调用
#也可以自己指定加载定义数据
#testdb中的数据可以被使用，表名（rowname）  p98
class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product=Product.new
    # product.title="威龙"
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product=Product.new(title:"大衣",description:"森马",image_url:"in the taobao.jpg")
    product.price=-2
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],product.errors[:price]
    # puts Hash===product.errors
    product.price=0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],product.errors[:price]
    product.price=1
    assert product.valid? ,"#{product}"
  end

  def new_product(image_url)
    Product.new(title:"red monutain",description:"good",price: 1,image_url:image_url)
  end
  test "image_url" do
    good=%w(a.jpg b.png c.gif d.Gif e.JPg f.Png)
    bad=%w(A.pgd b.scd d.bmp e.efd)
    good.each do |image_url|
      product=new_product(image_url)
      assert product.valid? ,"#{product.errors[:title]}"

    end

    bad.each do |image_url|
      product=new_product(image_url)
      assert product.invalid?

    end
  end

  #要测试title是唯一的必须先在test数据库中有数据
  test "product is not valid without a unique title"do
    product=Product.new(title:products(:java).title,image_url:"java.jpg",description:"好书",price:58)
    # product=Product.new(title:"a",image_url:"java.jpg",description:"好书",price:58)
    #如果product对象没有通过validition的话，就会将错误填充给product.errors对象
    assert product.invalid?
    #assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    assert_equal ["has already been taken"],product.errors[:title]
    # puts          product.errors[:title]

  end
end
