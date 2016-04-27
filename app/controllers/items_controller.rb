class ItemsController < ApplicationController



  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "hey, your item was saved"
    else
      flash[:alert] = "whoops!"
    end

    redirect_to user_path(current_user)
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
