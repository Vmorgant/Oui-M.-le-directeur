require 'squib'
data = Squib.csv data: File.read('data.csv').force_encoding('UTF-8'),explode: 'qty'
num_cards = data['name'].size 
Squib::Deck.new cards: num_cards, layout: 'economy.yml'do
  background color: 'white'
  text str: data["name"], layout: 'title'
  text str: data["description"], layout: 'description'
  png file: data["image"], layout: 'art'
  save_png
  save_pdf trim: 37.5
end