class HomeController < ApplicationController

  def index
    @sermons = Sermon.limit(6)
  end

end
