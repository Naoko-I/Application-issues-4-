class RelationshipsController < ApplicationController

  def follows
  	@user = User.find(params[:user_id])
    @follows = Relationship.where(params[:follower_id])
  end

  def followers
  end

  def index
  	# @follows = User.find(params[:relationship][:follow_id]).all
  end

  def create
  	follower = User.find(params[:user_id])
  	relation = Relationship.new
  	relation.follower_id = current_user.id
  	relation.followed_id = follower.id
  	# binding.pry
  	relation.save
  	redirect_to request.referer

  	# following = current_user.follow(user)
  	# if following.save
  	#    redirect_to request.referer
  	# end
  end

  def destroy
  	Relationship.find_by(follower_id: current_user.id,followed_id: params[:user_id]).destroy
    # find_byはid以外のカラムでデータ探すときに使う!
    redirect_to request.referer
  end

  private

end
