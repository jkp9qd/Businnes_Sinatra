require 'sinatra'
require 'sendgrid-ruby'
require './send_email'



get '/' do
  erb :home
end

get '/gallery' do
  erb :gallery
end

get '/contact' do
  erb :contact
end

get '/about' do
  erb :about
end

post '/contact' do
  status_code = send_email(
    'jarviskpotter@gmail.com',
    'New Contact From Submission',
    'jarviskpotter@gmail.com',
    'Name: ' + params[:name] + '<br>' +
    'Email address: ' + params[:email] + '<br>' +
    'Message: ' + params[:message]
  )
  "Thank you contacting us."
end
