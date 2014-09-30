class SubmitformsController < ApplicationController
  require "rest-client"
  respond_to :html, :js, :json, :xml

  def random_ok_note
  end

  def index
    @servernodes = Servernode.all
    respond_with(@servernodes)
  end

  def new
    @servernode = Servernode.new
  end

  #instantiate a Servenode object on both sides
  def create
    @servernode = Servernode.create(servernode_params)
    p = {:servernode => {:name => params[:servernode][:name],
            :status => params[:servernode][:status]}}
    RestClient.post('http://localhost:3000/servernodes',p)
    redirect_to submitforms_path
  end

  def edit
    @servernode = Servernode.find(params[:id])
  end

  #update properties of nodes => need to update frequently
  def update
    id = params[:id]
    p = {:servernode => {:name => params[:servernode][:name],
      :status=>params[:servernode][:status]}}
    @servernode = Servernode.find(params[:id])
    @servernode.update(servernode_params)
    RestClient.put("http://localhost:3000/servernodes/#{id}",p)
    render :nothing => :true
  end


  private
    def servernode_params
      params.require(:servernode).permit(:name,:status)
    end



end

