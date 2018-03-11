Rails.application.routes.draw do
  root 'presents#index'
  resources :presents, only: %i(index) do
    post 'send_code', on: :collection
  end
end
