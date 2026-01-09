Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :empresas
    resources :pedidos_compras
    resources :notas_fiscais
  end
  mount_devise_token_auth_for "User", at: "auth"
end
