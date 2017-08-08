Rails.application.routes.draw do
  get '/' => 'food_items#index'
  get '/food' => 'food_items#index'
  get '/food/new' => 'food_items#new'
  post '/food' => 'food_items#create'
  get '/food/:id' => 'food_items#show'
  get '/food/:id/edit' => 'food_items#edit'
  patch '/food/:id' => 'food_items#update'
  delete '/food/:id' => 'food_items#destroy'


  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/yourshoppingcart' => 'carted_foods#index'
  post '/yourshoppingcart' => 'carted_foods#create'
  delete '/yourshoppingcart/:id' => 'carted_foods#destroy'


  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  get '/orders/:id/edit' => 'orders#edit'
  patch '/orders/:id' => 'orders#update'

end
