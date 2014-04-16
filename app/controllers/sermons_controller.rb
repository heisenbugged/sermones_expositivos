class SermonsController < ApplicationController

  respond_to :html

  def index
    if params[:category]
      @sermons = Sermon.where(category: params[:category]).page(params[:page] || 1).per(12)
    else
      @categories = Sermon.unscoped.group('category')
                          .select('category, COUNT(id) as sermons_count')
                          .where('category IS NOT NULL')
                          .order('category asc')
    end

  end

  def new
    @sermon = Sermon.new
    render layout: 'application'
  end

  def edit
    @sermon = Sermon.find params[:id]
    render layout: 'application'
  end

  def update
    @sermon = Sermon.find params[:id]
    flash[:notice] = "Sermon saved successfully" if @sermon.update_attributes(sermon_params)
    respond_with(@sermon, location: sermons_path)
  end



  def create
    @sermon = Sermon.new sermon_params
    flash[:notice] = "Sermon saved successfully" if @sermon.save
    respond_with(@sermon, location: sermons_path)
  end

  private

  def sermon_params
    params[:sermon].permit(:title, :author, :audio, :date, :category)
  end

end
