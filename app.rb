require 'sinatra'
require 'date'
require 'twilio'
require 'yaml'
require 'builder'

CALLER_ID = 4155992671

#config = YAML.load_file('./config.yml')
#Twilio.connect(config['development']['TWILIO_SID'],config['development']['TWILIO_TKN'])

helpers do
  def sms(message)
  Twilio::Sms.message(CALLER_ID, params[:Caller], message)
  end
end

post '/' do
  builder :hello
end

post '/friday' do

  if (Date.today.wday + 1 == 5)
    #sms("Yes!!!")
    builder :yes
  else
    #sms("No :(")
    builder :no
  end
end
