class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      #binding.pry
      redirect '/ethical_arguments'
    else
      erb :"/users/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect '/ethical_arguments'
    else
      erb :"/users/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    erb :"/users/show"
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])

    erb :"/users/edit"
  end


  post "/signup" do
    #your code here
    username = params[:username]
    email = params[:email]
    password = params[:password]

    #binding.pry
    if username != "" && email != "" && password != "" && !username_taken?(username) && !email_taken?(email)
      user = User.create(email: email, username: username, password: password)
      session[:user_id] = user.id
      redirect '/ethical_arguments'
    else
      redirect '/signup'
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/ethical_arguments'
    else
      redirect '/signup'
    end
  end

  patch "/username" do
    if logged_in?
      username = params[:username]
      
      if !username_taken?(username)
        current_user.update(username: username)
      end

      redirect "/users/#{current_user.slug}/edit"
    else
      redirect '/login'
    end
  end

  patch "/email" do
    if logged_in?
      email = params[:email]
      
      if !email_taken?(email)
        current_user.update(email: email)
      end

      redirect "/users/#{current_user.slug}/edit"
    else
      redirect '/login'
    end
  end

  delete "/users/:id" do
    if logged_in?
      User.destroy(current_user.id)
      redirect '/logout'
    else
      redirect '/login'
    end
  end

  #in future, patch pasword too
end
