# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'feedbacks', :to => 'feedbacks#index'
get 'feedbacks/my', :to => 'feedbacks#my'
put 'feedbacks', :to => 'feedbacks#update'


resources :feedbacks
