Rails.application.routes.draw do
    resources :posts
    get 'home/index'
    # devise_for :users
    root 'home#index'

    devise_for :users, skip: [:registrations], controllers: {passwords: 'passwords'}

    resources :users do
        get :password_edit, on: :member
        put :password_update, on: :member
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
