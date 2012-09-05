TrendApp::Application.routes.draw do  
  resources :companies
  resources :daily_quotes

  match '/' => "static_pages#home"
  match "/about" => "static_pages#about"
  match '/:ticker' => "company#show"
end
