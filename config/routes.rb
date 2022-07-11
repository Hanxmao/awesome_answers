Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get('/welcome', {to: 'welcome#index'}) 
  get '/about' => 'welcome#about'
  get('/form_example', {to: 'welcome#form_example'})

  # get 'questions/new' => 'questions#new'
  # post 'questions' => 'questions#create', as: :create_question

  # get "questions" => 'questions#index'
  # get "questions/:id" => "questions#show", as: :question

  # get 'questions/:id/edit' => 'questions#edit', as: :edit_question
  # patch 'questions/:id' => 'question#update'

  # delete 'questions/:id' => 'question#destroy', as: :delete_question

  resources :questions
end
