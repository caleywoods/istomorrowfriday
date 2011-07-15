require 'sinatra'
require 'date'
require 'twilio'
require 'yaml'
require 'builder'

CALLER_ID = 4155992671

get '/' do
  "Text 'is tomorrow friday?' to 415-599-2671!"
end

get '/friday' do
  config = YAML.load_file('./config.yml')
  Twilio.connect(config['development']['TWILIO_SID'],config['development']['TWILIO_TKN'])
  if (Date.today.wday + 1 == 5)
    Twilio::Sms.message(CALLER_ID, 6603539430, "Yes!!!")
    #<Response>
      #<SMS>Yes!!!</SMS>
    #</Response>
  else
    Twilio::Sms.message(CALLER_ID, 6603549430, "No :(")
    #<Response>
      #<SMS>No :(</SMS>
    #</Response>
  end
end
