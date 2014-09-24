class SubmitformsController < ApplicationController
#require "uri"
#require "net/http"
require "rest-client"

  def new
    @servernode = Servernode.new
  end

  #instantiate a Servenode object on both sides
  def create
    #@servernode = Servernode.new
    #puts params[:servernode][:name]
    s1 = params[:servernode][:name]
    s2 = params[:servernode][:status]
    p = {:servernode => {:name => s1,:status => s2}}
    @servernode = Servernode.create(params.require(:servernode).permit(:name,:status))
    #binding.pry
    #if @servernode.save
      RestClient.post("http://localhost:3000/servernodes",p)
      redirect_to submitforms_path
    #else
     # render :new
    #end
  end

  def index
    @servernodes = Servernode.all
    #params = {"utf8"=>"✓",
    #"servernode"=> {"name" =>"what the fuck","status" =>"Available"}}
    #params = {:servernode => {:name => "test101", :status => "Available"}}
    #uri = URI('http://localhost:3000/servernodes')
    #x = CGI::escapeHTML(params)
    #Net::HTTP.post_form(uri, params)
  end

  def edit
    @servernode = Servernode.find(params[:id])
  end

  def update
    id = params[:id]
    s1 = params[:servernode][:name]
    s2 = params[:servernode][:status]
    p = {:servernode => {:name => s1,:status => s2}}
    @servernode = Servernode.find(params[:id])
    @servernode.update(:name=>params[:servernode][:name],:status =>params[:servernode][:status] )
    RestClient.put("http://localhost:3000/servernodes/#{id}",p)
    redirect_to submitforms_path
  end


end

