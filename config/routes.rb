Politics::Application.routes.draw do
  get "home/index"

  resources :questions
  resources :parties
  resources :machings, :replace_id_with => 'access_token' do
    collection { post "result" }
    resources :answers
  end
  resources :answers
  root :to => 'home#index'
  get "android/new"
  match "/android", :controller => :android, :action => :index
  match "android/post", :controller => :android, :action => :post
  post "android/create", :controller => :android, :action => :create 
end
