require 'sinatra'
require 'omniauth-asana'
require 'ostruct'

set :port, ENV['PORT']

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :asana, ENV['ASANA_CLIENT_ID'], ENV['ASANA_CLIENT_SECRET']
end

get '/' do
  if session[:auth]
    <<-HTML
    Welcome, #{session[:user][:name]}!
    Your token is #{session[:auth].token}, your id is #{session[:uid]}
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
  raise StandardError, params
end

get '/logout' do
  session.destroy
  redirect '/'
end
