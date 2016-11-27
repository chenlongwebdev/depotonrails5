Rails.application.routes.draw do
  #将根路径设置为store#index,而且要放在第一行
  #in the process we added an as: 'store_index' option. The latter tells Rails to create
  # store_index_path and store_index_url accessor methods, enabling existing code—and
  # tests!—to continue to work correctly.
  root "store#index",as: 'store_index'
  # get "store/index"

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
