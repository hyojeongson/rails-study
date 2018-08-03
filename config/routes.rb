Rails.application.routes.draw do
    resources :posts do
        resources :post_itmes, only: [:destroy, :update ]
    end
    get 'home/index'
    # devise_for :users
    root 'home#index'

    devise_for :users, skip: [:registrations], controllers: {passwords: 'passwords'}

    resources :users do
        get :password_edit, on: :member
        put :password_update, on: :member
    end
end
