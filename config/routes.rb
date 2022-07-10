Rails.application.routes.draw do
  get 'question/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get('/welcome', {to: 'welcome#index'}) 
  get '/about' => 'welcome#about'
  get('/form_example', {to: 'welcome#form_example'})
end
