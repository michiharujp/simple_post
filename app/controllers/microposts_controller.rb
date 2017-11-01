class MicropostsController < ApplicationController

  def show
    @microposts = Micropost.all
  end

end
