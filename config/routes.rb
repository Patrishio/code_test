Rails.application.routes.draw do
  root 'static_pages#home'
  get  'submit' => 'static_pages#submit'
end
