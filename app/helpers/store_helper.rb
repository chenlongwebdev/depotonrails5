module StoreHelper
  def showTime
    t=Time.now
    "#{t.year}年 #{t.month}月 #{t.day} 日"
  end
end
