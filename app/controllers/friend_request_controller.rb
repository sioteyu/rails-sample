class FriendRequestController < ApplicationController
  def index
    @friend_requests = current_user.friend_request
  end

  def create
    target = User.find_by(id:params[:target_id])
    target.friend_request.build(target_id:current_user.id, name:current_user.name)
    if target.save
      redirect_to '/users/search'
    end
  end

  def destroy
    current_user.friend_request.find_by(id:params[:format]).destroy
    redirect_to '/profile'
  end
end
