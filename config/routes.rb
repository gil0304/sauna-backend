Rails.application.routes.draw do
  resources :users, only: [:create]  # 新規登録用のルート
  post '/users/sign_in', to: 'users#sign_in'  # ログイン用のルート

  get "up" => "rails/health#show", as: :rails_health_check
end
