class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :chatroom, :is_instructor?, :logged_in?, :is_owner?

  def chatroom
    @chatroom = Chatroom.first
  end

  def logged_in?
    current_user
  end

  def is_instructor?
    if logged_in?
      current_user.user_type == "Instructor"
    else
      return false
    end
  end

  def is_owner?(item)
    if logged_in?
      current_user.id == item.user.id
    else
      return false
    end
  end


  # <% if @user.errors.any? %>
  #   <div id="error_explanation" class="col-md-offset-4">
  #     <h2>
  #       Oops! <%= pluralize(@user.errors.count, "error") %>!
  #     </h2>
  #     <ul>
  #       <% @user.errors.full_messages.each do |msg| %>
  #         <li><%= msg %></li>
  #       <% end %>
  #     </ul>
  #   </div>
  # <% end %>



  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
