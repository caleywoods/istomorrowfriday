require 'sinatra'
require 'date'
require 'builder'
require 'haml'

get '/' do
  haml :index
end

post '/' do
  if (Date.today.wday + 1 == 5)
    builder :greet_friday
  else
    builder :greet_normal
  end
end

post '/friday' do

  if (Date.today.wday + 1 == 5)
    builder :yes
  elsif (Date.today.wday == 5)
    builder :today
  else
    builder :no
  end
end
