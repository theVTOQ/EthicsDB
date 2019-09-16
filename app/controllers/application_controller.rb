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

    def unique_topics
      unique_topics = []
      EthicalArgument.all.each do |ethical_argument|
        topic = ethical_argument.topic
        unique_topics << topic unless unique_topics.include?(topic)
      end
      unique_topics
    end

    def ethical_arguments_by_topic(topic)
      EthicalArgument.where(topic: topic)
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end

    def rank_morality_of_possible_actions(possible_actions, imperative_rankings)

    end

    def username_taken?(username)
      User.all.collect{|user| user.username}.include?(username)
    end

    def email_taken?(email)
      User.all.collect{|user| user.email}.include?(email)
    end
  end
end
