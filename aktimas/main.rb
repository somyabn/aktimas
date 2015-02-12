require 'sinatra'
require 'mandrill'
# require 'CSV'
require_relative './CSVfileProcess.rb'

configure(:development){set :database, "sqlite3:contact.sqlite3"}

get '/' do
	erb :home
end

get '/about' do
	erb :about
end

get '/products' do
	erb :products
end

get '/careers' do
	erb :careers
end

get '/contact_us' do 
	erb :contact_us
end

get '/injectionslist' do
	@product1= csvfileProcess('InjectionsName.csv')
	erb :injectionslist
end

get '/powderslist' do
	@product2= csvfileProcess('PowdersName.csv')
	erb :powderslist
end
get '/syrupslist' do
	@product3= csvfileProcess('SyrupsName.csv')
	erb :syrupslist
end
get '/tabletslist' do
	@product4= csvfileProcess('TabletsName.csv')
	erb :tabletslist
end

post '/contact' do
	# puts "my params are:" + params.inspect
	contact_name= params["name"]
	contact_email = params["email"]
	email_body="We received your message"
	m = Mandrill::API.new
	message = {  
	 :subject=> "Thanks for your email!",  
	 :from_name=> "Nick",  
	 :text=>email_body,  
	 :to=>[  
	   {  
	     :email=> contact_email,  
	     :name=> contact_name  
	   }  
	 ],  
	 :html=>"<html><h1>Hi <strong>#{email_body}</strong>, how are you?</h1></html>",  
	 :from_email=>"nicholas_donias@alumni.brown.com"  
	}  
	sending = m.messages.send message 
	puts sending
	redirect to ('/thanks')
end

get '/thanks' do 
	erb :thanks
end