Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "worker_login" => "top#worker_login", as: "worker_login"
  get "cart" => "top#cart", as: "cart"
  
  resources :customers do
    collection {get "search" }
    resources :orders, only: [:index, :show, :new, :create]
  end
  resources :orders, only: [:index, :show, :create, :update, :edit]
  
  resources :dishes do
    collection {get "search" }
    member { patch :stop }
    resources :sale_manegements, only: [:index, :edit, :update]
  end
  resources :sale_manegements, only: [:index, :edit, :update]
  resources :allergies
  resources :workers
  
  resources :boxes
  
  resources :box_kinds, only: [:index, :show] do
    resources :boxes, only: [:create, :destroy]
  end
  resource :session, only: [:create, :destroy]
  resource :worker_session, only: [:create, :destroy]
  resource :cart, only: [:create, :destroy]
end
