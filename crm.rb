require_relative 'contact'
require 'sinatra'


get '/' do
	@crm_app_name = "Nurbrun's"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :add_new
end