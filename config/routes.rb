Rails.application.routes.draw do


  root 'users#index'

  get 'ClassAnnouncement' => 'announcements#index', as: :class_announcement
  get 'announcements/new' => 'announcements#new'
  post 'announcements' => 'announcements#create'
  get 'announcements/:id' => 'announcements#show', as: :announcement
  get 'announcements/:id/edit' => 'announcements#edit', as: :edit_announcement
  patch 'announcements/:id' => 'announcements#update', as: :update_announcement
  delete 'announcements/:id' => 'announcements#destroy', as: :destroy_announcement

  get 'articles/:article_id/likes' => 'likes#new', as: :article_likes
  get 'surveys/:survey_id/likes' => 'likes#new', as: :survey_likes
  post 'surveys/:survey_id/likes' => 'likes#create2'
  post 'articles/:article_id/likes' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy', as: :destroy_like

  #chats routes
  get 'chatrooms/:chatroom_id/chats' => 'chats#new', as: :chatroom_chats
  post 'chatrooms/:chatroom_id/chats' => 'chats#create'
  get 'chats/:id/edit' => 'chats#edit', as: :edit_chat
  patch 'chats/:id' => 'chats#update', as: :update_chat
  delete 'chats/:id' => 'chats#destroy', as: :destroy_chat

  #chatroom route
  get 'chatrooms/:id' => 'chatrooms#show', as: :chatroom
  get 'conversations/:conversation_id/messages' => 'messages#new', as: :conversation_messages
  post 'conversations/:conversation_id/messages' => 'messages#create'
  get 'messages/:id/edit' => 'messages#edit', as: :edit_message
  patch 'messages/:id' => 'messages#update', as: :update_message
  delete 'messages/:id' => 'messages#destroy', as: :destroy_message

  #conersations routes
  get 'conversations/index' => 'conversations#index', as: :user_inbox
  get 'users/:user_id/conversations' => 'conversations#new', as: :user_conversations
  get 'conversations/:id' => 'conversations#show', as: :conversation
  post 'users/:user_id/conversations' => 'conversations#create'

  #answers routes
  get 'surveys/:survey_id/answers' => 'answers#new', as: :survey_answers
  post 'surveys/:survey_id/answers' => 'answers#create'
  get 'answers/:id/edit' => 'answers#edit', as: :edit_answer
  patch 'answers/:id' => 'answers#update', as: :update_answer
  delete 'answers/:id' => 'answers#destroy', as: :destroy_answer

  #surveys routes
  get 'FeedbackInbox' => 'surveys#index', as: :private_feedback
  get 'surveys/new' => 'surveys#new'
  get 'surveys/:id' => 'surveys#show', as: :survey
  get 'surveys/:id/edit' => 'surveys#edit', as: :edit_survey
  post 'surveys' => 'surveys#create'
  patch 'surveys/:id' => 'surveys#update', as: :update_survey
  delete 'surveys/:id' => 'surveys#destroy', as: :destroy_survey

  #comments routes
  get 'articles/:article_id/comments' =>  'comments#new', as: :article_comments
  post 'articles/:article_id/comments' => 'comments#create'
  get 'comments/:id/edit' => 'comments#edit', as: :edit_comment
  patch 'comments/:id' => 'comments#update', as: :update_comment
  delete 'comments/:id' => 'comments#destroy', as: :destroy_comment

  #articles routes to create/show/edit/destroy
  get 'GeneralDiscussion' => 'articles#index', as: :general_discussion
  get 'GeneralDiscussion_LikeCount' => 'articles#like'
  get 'articles/new' => 'articles#new'
  get 'articles/:id' => 'articles#show', as: :article
  get 'articles/:id/edit' => 'articles#edit', as: :edit_article
  post 'articles' => 'articles#create'
  patch 'articles/:id' => 'articles#update', as: :update_article
  delete 'articles/:id' => 'articles#destroy', as: :destroy_article

  #users route for signing up and editing account information
  get 'Homepage' => 'users#index', as: :homepage
  get 'users/new' => 'users#new', as: :signup
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user_information
  patch 'users/id' => 'users#update', as: :users_update

  #sessions route
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
