require 'sinatra'
require 'google/apis/sheets_v4'
require 'httparty'
require 'cgi'
require './adalberto'
require './category_engine'
require './finance_entry'
require './finance_spreadsheet'
require './google_sheets_api'
require './message'
require './telegram'

post '/' do

  json = JSON.parse(request.body.read)
  message = Message.new(json)
  adalberto = Adalberto.new(message)

  adalberto.execute!

  status 200
end
