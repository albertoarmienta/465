Rails.application.routes.draw do
  root "home#index"

  get 'answer', to: 'home#answer'
end
