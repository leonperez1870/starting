class DoctorController < ApplicationController
  def index

  end

  def search
  	#parameters = { term: 'doctor', limit: 16, sort: 2, category_filter: 'cardiologist', radius_filter: 30000 }
    # render json: Yelp.client.search(params[:location], parameters)
    parameters = {term: params[:term], category_filter: 'physicians', limit: 16, sort: 2, radius_filter: 30000}
    @results = Yelp.client.search(params[:location], parameters)

  end
  def json
  	respond_to do |format|
  		format.html #json.html.erb
  		format.json { render json: @results }
  	end
  	#render json: Yelp.client.search('New York', term: 'bakery')
  end
end
