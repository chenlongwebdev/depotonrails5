# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Product.create(title:'SUNSTAR Ora2 キレイをまいにち　ドロピカルマンゴー',
               description:
                   %{
        <p>
            惊爆价，只要28，薄荷味漱口水带回家。made in china
        </p>
    },
               image_url: 'ora2.jpg',
               price:27.99
)
Product.create(title:'witcher3 昆特3',
              description:
                   %{
        <p>
            2015年度游戏，演绎了主角杰罗特和女儿，人妻，小三，女学生，女爵..的离奇故事
            更有昆特牌局等待大家
        </p>
    },
              image_url: 'witcher3.jpg',
              price:148
)
Product.create(title:'Programming Ruby 2.3',
              description:
                   %{
        <p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>
    },
              image_url: 'ruby.jpg',
              price:68
)