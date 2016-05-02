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

  def destroy
    @item = current_user.items.find(params[:id]) # also tried current_user.items.find(item_params)

    if @item.destroy
      flash[:notice] = "Way to go!! You just completed \"#{@item.name}\"!!!"
      redirect_to root_path
    else
      flash[:error] = "An error occurred while trying to complete the item. Please try again."
      redirect_to root_path # is there a way to render the user's show view again for the user trying to complete an item..
      #render :show
    end
  end

private

  def item_params
    params.require(:item).permit(:name)
  end

end
