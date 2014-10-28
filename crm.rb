require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'


get '/' do
	@crm_app_name = "Nurbrun's"
	erb :index
end

get '/contacts' do
	@contacts = []
	@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  	@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  	@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	
	erb :contacts
end

get '/contacts/new' do
	erb :add_new
end