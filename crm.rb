require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$rolodex = Rolodex.new

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