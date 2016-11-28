require 'test_helper'
#product可以通过scaffold来自动生成，但是store不行，因为store在db中没有对应的table 这只是products的展示界面
class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    #test html 的内容展示
    #数据来自test.db fixtures 下面的yml文件，yml file 中的数据被插入db无需模型层验证

    get store_index_url
    assert_response :success

=begin
    the type of test that assert_select() performs varies based
    on the type of the second parameter. If it’s a number, it’s treated as a quantity.
    If it’s a string, it’s treated as an expected result. Another useful type of test
    is a regular expression
=end
    #http://edgeapi.rubyonrails.org/classes/ActionDispatch/Assertions/SelectorAssertions.html
    #如果不指定第一个元素，则表示在响应的html中进行判断，除非有一个assert_select嵌套在一个assert_select block 中，

=begin
第一个assert_select 对整个html做深度优先遍历处ol匹配的元素数组，再讲数组中的每一个元素交个下一个assert_select
   assert_select "ol" do |elements|
    elements.each do |element|
      assert_select element, "li", 4
    end
  end


第一个assert_select 对整个html做深度优先遍历处ol匹配的元素数组，再讲数组交个下一个assert_select
   assert_select "ol" do
    assert_select "li", 8
   end
=end
    assert_select "#columns #side a", minimum:4
    assert_select "#main .entry",3
    #Assertion is true if the text value of at least one element matches the string or regular expression
    assert_select 'h3','thinkinjava'
    assert_select 'h3',products(:java).title
    assert_select '.price',/￥[,\d]+\.\d\d/
    assert_select 'ul>li' ,4 #表示ul 标签下的li 标签
    assert_select 'body ul',1#表示body 下面有一个ul标签
    #assert_select 'body>ul',1 表示body 下面直接的一个ul子标签


    #匹配紧跟在id=side的div之后的id=main 的div
    pars = css_select("div#side+div#main")
    pars.each do |par|
      # Do something fun with paragraphs here...
      puts "有了"
      puts par
    end


    #匹配标签属性时要加上 []符号
    pars = css_select("[class~=entry]")
    pars.each do |par|
      # Do something fun with paragraphs here...
      puts "[class~=entry]"
      puts par
    end



    pars = css_select("[class|=entry]")
    pars.each do |par|
      # Do something fun with paragraphs here...
      puts "[class|=entry]"
      puts par
    end
    pars = css_select("[class^=entry]")
    pars.each do |par|
      # Do something fun with paragraphs here...
      puts "[class^=entry]"
      puts par
    end

  end

end
