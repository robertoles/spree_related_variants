Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :related_variants
    end
  end
end
