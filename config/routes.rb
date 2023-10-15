Rails.application.routes.draw do


  resources :pins
  resources :rails
  resources :maps do
    get 'map', on: :collection
 end

  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end


  scope module: :public  do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    resources :tags
    resources :post

      # get 'serch_tag' => 'post_tag'
      get 'customers/my_page' => 'customers#show'


  end


  namespace :admin do
    root to: 'homes#top'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html





# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end
