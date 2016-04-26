class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def root_redirect # => redirects a user upon login to their Profile/Task List /users/:id
    redirect_to user_path(current_user)
  end
end
