Rails.application.routes.draw do
  root 'facebook_share_options#index'
  post 'share_link' => 'facebook_share_options#share_link'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
