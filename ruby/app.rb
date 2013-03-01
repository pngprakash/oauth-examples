require 'sinatra'
require 'omniauth'
require 'omniauth-asana'
require "ostruct"

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :asana, ENV['ASANA_CLIENT_ID'], ENV['ASANA_CLIENT_SECRET']
end

helpers do
  def auth
    @auth ||= session[:auth]
  end

  def logged_in
    !!auth
  end

  def current_user
    return nil unless logged_in

    @current_user ||= OpenStruct.new(session[:user])
  end
end

get '/' do
  if logged_in
    <<-HTML
    Welcome, #{current_user.name}!
    Your token is #{auth.token}, your id is #{session[:uid]}
    <a href='/logout'>Logout</a>
    HTML
  else
    <<-HTML
    <a href='/auth/asana'>Sign in with Asana</a>
    HTML
  end
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  session[:auth] = auth.credentials
  session[:uid] = auth.uid
  session[:user] = auth.info
  redirect '/'
end

get '/auth/failure' do
  logger.info params
  raise StandardError, params
end

get '/logout' do
  session.destroy
  redirect '/'
end
