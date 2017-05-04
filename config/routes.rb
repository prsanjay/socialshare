Rails.application.routes.draw do

  root 'home#index'

  post 'share_link' => 'facebook_share_options#share_link'
  get 'facebook_page' => 'facebook_share_options#index'

  post 'linkedin_share' => 'linkedin_shares#share_link'
  get 'linked_page' => 'linkedin_shares#index'

  post 'twitter_share' => 'twitter_shares#share_link'
  get 'twitter_page' => 'twitter_shares#index'


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
