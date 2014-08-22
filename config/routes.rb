# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :projects do
  member do
    get 'settings(/:tab)', :action => 'settings', :as => 'settings'
    post 'columns'
  end
end
