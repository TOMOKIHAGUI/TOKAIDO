class HomesController < ApplicationController

  def top
     @post = Post.limit(4).order("created_at DESC")
  end

end
