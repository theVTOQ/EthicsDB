require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def sort_and_rank(ethical_arguments)
      ethical_arguments.map {
        |ethical_argument| [ethical_argument.topic, ethical_argument]
      }.to_h.sort_by {|topic, ethical_argument| ethical_argument.subscribers.count }
    end
  end
end
