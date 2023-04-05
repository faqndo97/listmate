Rails.application.routes.draw do
  root "lists#index"

  resources :lists, param: :share_id, only: %i[index new create update]
  get "lists/:share_id", to: "lists#edit"
end
