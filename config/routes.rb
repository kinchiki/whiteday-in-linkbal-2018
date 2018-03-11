Rails.application.routes.draw do
  root 'presents#index'
  resources :presents, only: %i(index show) do
    post 'send_code', on: :collection
  end
end
