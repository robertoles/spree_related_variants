Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :products, only: [] do
      resources :related_variants
    end

    resources :variants do
      collection do
        get :search
      end
    end

  end
end
