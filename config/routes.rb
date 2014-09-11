# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :projects do
  member do
    post 'columns'
  end
end
