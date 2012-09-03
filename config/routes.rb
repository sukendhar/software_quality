SoftwareQualityCraft::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end

  #r.results "results", :conditions => {:method => :get}, :action => "index"
  #r.result "results/:survey_code", :conditions => {:method => :get}, :action => "show"
  scope :results do
    match '/results/index' => 'results#index', :via => :get, :as => :results_index
    match '/results/:survey_code' => 'results#show', :via => :get, :as => :results_show
  end
end
