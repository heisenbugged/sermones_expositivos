class SermonsController < ApplicationController

  respond_to :html

  def index
    @sermons = Sermon.page(params[:page] || 1).per(12)
  end

  def new
    @sermon = Sermon.new
    render layout: 'application'
  end

  def create
    @sermon = Sermon.new sermon_params
    flash[:notice] = "Sermon saved successfully" if @sermon.save
    respond_with(@sermon, location: sermons_path)
  end

  private

  def sermon_params
    params[:sermon].permit(:title, :author, :audio, :date)
  end

end
