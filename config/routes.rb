Rails.application.routes.draw do
  root "homes#show"

  scope "(:locale)", locale: /en|es/ do
    resources :lists, param: :share_id, only: %i[index new create update]
    get "lists/:share_id", to: "lists#edit"
  end

  resources :lists, param: :share_id, only: %i[index new create update]
  get "lists/:share_id", to: "lists#edit"
end
