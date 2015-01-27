require 'mandrill'  
m = Mandrill::API.new
message = {  
 :subject=> "Hello from the Mandrill API",  
 :from_name=> "Nick",  
 :text=>"Hi message, how are you?",  
 :to=>[  
   {  
     :email=> "ndonias@gmail.com",  
     :name=> "Nick Donias"  
   }  
 ],  
 :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
 :from_email=>"nicholas_donias@alumni.brown.com"  
}  
sending = m.messages.send message  
puts sending