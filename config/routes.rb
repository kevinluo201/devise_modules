Rails.application.routes.draw do
  root "pages#index"
  devise_for :users, omniauth_providers: %i[facebook], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
