class ItemsController < ApplicationController

  def index
    @items = current_user.items
  end

  #New View
  def new
    @item = Item.new
  end

  #Item View for a Specific Item
  def show
    @item = Item.find(params[:id])
  end

  #Updates the Instance Variables of a Specific Item
  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  #Edit View for a Specific Item
  def edit
    @item = Item.find(params[:id])
  end

  #Creates a New Item
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  #Deletes a Specific Item
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :action => 'index'
  end


  private

  def item_params
    params.require(:item).permit(:name, :retailer, :description, :url, :price)
  end
end
