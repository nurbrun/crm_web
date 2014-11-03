require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact 
	include DataMapper::Resource

	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
	@crm_app_name = "Nurbrun's"
	erb :index
end

get '/contacts' do
	@contacts = Contact.all
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
	contact = Contact.create(
		:first_name => params[:first_name],
		:last_name => params[:last_name],
		:email => params[:email],
		:note => params[:note]
		)
	redirect to('/contacts')

end

get '/contacts/:id' do
  	@contact = Contact.get(params[:id].to_i)
  	if @contact
  		erb :show_contact
  	else
  		raise Sinatra::NotFound
  	end
end

get '/contacts/:id/edit' do
  	@contact = Contact.get(params[:id].to_i)
  	if @contact
  		erb :edit_contact
  	else
  		raise Sinatra::NotFound
  	end
end

put "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], note: params[:note])

		# can be done either way
		# @contact.update(:first_name => params[:first_name])
		# @contact.update(:last_name => params[:last_name])
		# @contact.update(:email => params[:email])
		# @contact.update(:note => params[:note]) 

		redirect to("/contacts")
	elsec
		raise Sinata::NotFound
	end
end

delete "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.destroy
		redirect to("/contacts")
	else
		raise Sinatra::Not Found
	end
end
