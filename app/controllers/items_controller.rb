class ItemsController < ApplicationController

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Your task \"#{@item.name}\" was added! Go forth and be productive!"
    else
      flash[:alert] = "Oops... Something went wrong. Please refresh and try again."
    end

    redirect_to user_path(current_user)
  end

  def destroy
    @item = current_user.items.find(params[:id]) # also tried current_user.items.find(item_params)

    @item.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.js
    end
  end

private

  def item_params
    params.require(:item).permit(:name)
  end

end
