Rails.application.routes.draw do
    root 'home#index'
    get 'home/index'

    # devise_for :users
    devise_for :users, skip: [:registrations], controllers: {passwords: 'passwords'}

    resources :users do
        get :password_edit, on: :member
        put :password_update, on: :member
    end

    resources :posts
end
