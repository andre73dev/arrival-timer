require 'open-uri'

class RoutesController < ApplicationController

  def new
    @route = Route.new
=begin
    Route.delete_all()
    
    Route.create(
      name: "test route" , 
      description: "test" , 
      start_lat: 34.693738, 
      start_lng: 135.502165,
      end_lat: 35.658593, 
      end_lng: 139.745464
    )
    @route_request = Route.all
=end
#    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
#      marker.lat user.start_lat
#      marker.lng user.start_lng
#      marker.infowindow user.description
#      marker.json({title: user.name})
#    end
  end
  
  def create
    
    logger.debug(route_params)
    logger.debug(Geocoder.search(route_params[:origin])[0].geometry["location"])
    
    org_loc = Geocoder.search(route_params[:origin])[0].geometry["location"]
    dest_loc = Geocoder.search(route_params[:destination])[0].geometry["location"]
    
    @route = Route.new(
      origin: route_params[:origin],
      destination: route_params[:destination],
      start_lat: org_loc["lat"],
      start_lng: org_loc["lng"],
      end_lat: dest_loc["lat"],
      end_lng: dest_loc["lng"]
      )
    if @route.save
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to @route
    else
      render 'new'
    end
  end

  def show
    @route = Route.find(params[:id])
  end

  def test
    res = open('https://maps.googleapis.com/maps/api/directions/json?origin=Chicago,IL&destination=Los+Angeles,CA&waypoints=Joplin,MO|Oklahoma+City,OK&key=AIzaSyCrRtGWBJyRZPFcnWGpyiQjAE95uZCybDk')
    code, message = res.status # res.status => ["200", "OK"]
    if code == '200'
      result = ActiveSupport::JSON.decode res.read
      puts result
      
      
    else
      flash[:danger] = "res error! #{code} #{message}" 
    end
  end

  private
  
  def route_params
    params.require(:route).permit(:origin,:destination)
  end
  
end
