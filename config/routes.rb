Rails.application.routes.draw do

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


devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  get "search" => "searches#search"
  resources :pins
  resources :rails
  resources :maps do
    get 'map', on: :collection
    get '/maps', to: 'maps#index'
 end

  devise_scope :customer do

    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end



  scope module: :public  do
    root to: 'homes#top'
    get '/about' => 'homes#about'


    resources :customers, only: [:index, :show, :edit, :update] do
      collection do
        get :mypage
      end
    get 'confirm' => 'customers#confirm'
    patch 'withdrawal' => 'customers#withdrawal'
    end


    resources :tags
    resources :post

      # get 'serch_tag' => 'post_tag'


  end


  namespace :admin do
    root to: 'customers#index'
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
