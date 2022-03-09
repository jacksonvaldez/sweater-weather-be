Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get 'book-search', to: 'books/search#index' # Final Assessment
      get 'forecast', to: 'forecast/search#index'  # Part 1a
      get 'backgrounds', to: 'background/search#index' # Part 1b
      post 'users', to: 'users#create' # Part 2
      post 'sessions', to: 'sessions#create' # Part 3
    end
  end
end
