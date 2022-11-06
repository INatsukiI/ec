Rails.application.routes.draw do
  # 顧客用
  devise_for :customer,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  devise_scope :customer do
    get '/logout', to: 'public/sessions#destroy', as: :logout
  end


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    resource :customers, only: [:show, :edit, :update]
    get 'cusomers/quit' => 'customers#quit'
    patch 'cusomers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index, :show]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index,:create,:destroy, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    post 'orders/confirm' => 'orders#confirm'
    get  'orders/complete' => 'orders#complete'
    resources :orders, only: [:new,:create, :index, :show]
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index]
    resources :genres,    only: [:index, :create, :edit, :update]
    get 'search' => 'items#search'
    resources :items,     only: [:index, :new, :create, :show, :edit, :update]
    resources :orders,    only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

end
