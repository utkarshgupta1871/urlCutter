Rails.application.routes.draw do
  root 'cuts#index'
  get 'cuts' => 'cuts#index'
  get 'cuts/index' => 'cuts#index'
  get 'cuts/:id' => 'cuts#goto'
  get ':id' => 'cuts#goto'
  post 'cuts' => 'cuts#create'
  post 'cuts/index' => 'cuts#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
