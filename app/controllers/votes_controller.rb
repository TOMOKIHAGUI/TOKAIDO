class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(vote_params)
    @vote.user_id = current_user.id
    @vote.post_id = @post.id
    @vote.save

  end

  def destroy
    @post = Post.find(params[:post_id])
    @vote = @post.votes.find_by(user_id: current_user.id)
    @vote.destroy

  end

  private

  def vote_params
    params.require(:vote).permit(:detail, :user_id, :post_id)
  end

end
