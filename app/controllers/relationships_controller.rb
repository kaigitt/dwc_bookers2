class RelationshipsController < ApplicationController

  def follow
  current_user.follow(params[:id])
  case params[:order_sort]
  when "0"
    redirect_to user_path
  when "1"
    redirect_to users_path
  end
  end

def unfollow
  current_user.unfollow(params[:id])
  case params[:order_sort]
  when "0"
    redirect_to user_path
  when "1"
    redirect_to users_path
  end
end

end
