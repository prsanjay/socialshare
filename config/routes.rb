Rails.application.routes.draw do
  root 'facebook_share_options#index'
  post 'share_link' => 'facebook_share_options#share_link'
end
