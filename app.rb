require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      
      params[:pirate][:ships].each do |attributes_hash|
        Ship.new(attributes_hash)
      end
      
      @ships = Ship.all

      erb :"pirates/show"
    end

  end
end
