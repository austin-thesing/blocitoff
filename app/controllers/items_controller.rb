class ItemsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @item = Item.new
  end
  def create

  end
end
