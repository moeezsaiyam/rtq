ActionController::Routing::Routes.draw do |map|
 
  map.resources :translations


  map.root :controller => 'home'

  map.admin_dashboard '/admin_dashboard', :controller => 'admin'

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resources :topics do |topic|
    topic.resources :sub_topics do |sub_topic|
      sub_topic.resources :questions
    end
  end

  map.resource :session
  map.resources :verse, :collection => ["get_context"]
  map.connect '/verse/:id/:range', :controller => 'verse', :action => 'show'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.topic_slug ':topic_name_slug',   :controller => 'topics', :action => 'show'
  map.sub_topic_slug ':topic_name_slug/:sub_topic_name_slug',   :controller => 'sub_topics', :action => 'show'
  map.sub_topic_questions ':topic_name_slug/:sub_topic_name_slug/questions',   :controller => 'questions', :action => 'index'
  map.question_slug ':topic_name_slug/:sub_topic_name_slug/:question_slug',    :controller => 'questions', :action => 'show'

end
