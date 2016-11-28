class Product < ApplicationRecord
  validates :title,:description,:image_url,presence:true
  validates :price ,numericality:{greater_than_or_equal_to:0.01}
  validates :title,uniqueness: true
  validates :image_url,allow_blank: true,format:{
      #正则表达式后面的i的意思是忽略大小写
      with:/\.(jpg|png|gif)\Z/i,
      message:"the imageurl must end with gif or jpg or png"
  }
  length=20
  validates :title,length: { maximum: length ,message:"长度不能超过#{length}!!"}
end
