Refinery::Application.routes.draw do
  resources :categorizations

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :categorizations do
      collection do
        post :update_positions
      end
      resources :categories do
        collection do
          post :update_positions
        end
      end
    end
  end
end
