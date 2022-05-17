Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'home#index'

  get 'room_registrations/search', to: 'room_registrations#search'
  get 'room_registrations/search_free_word', to: 'room_registrations#search_free_word'

  resources :room_registrations
  resources :room_bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
