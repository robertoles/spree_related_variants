Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :related_variants
    end

    resources :variants do
      collection do
        get :search
      end
    end

  end
end
