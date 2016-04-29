class ItemsController < ApplicationController



  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Your item was saved!"
    else
      flash[:alert] = "Oops... Something went wrong. Please refresh and try again."
    end

    redirect_to user_path(current_user)
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
