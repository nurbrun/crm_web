require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new

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

get '/contacts/new' do
	erb :new_contact
end