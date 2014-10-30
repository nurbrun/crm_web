require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

get '/' do
	@crm_app_name = "Nurbrun's"
	erb :index
end

get '/contacts' do
	# @rolodex = $rolodex
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note], params[:id])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

get '/contacts/1000' do
  	@contact = $rolodex.find(1000)
  	erb :show_contact
end

get '/contacts/modify' do
	erb :modify
end

get '/contacts/remove' do
	erb :remove
end

contact = $rolodex.find(1000)