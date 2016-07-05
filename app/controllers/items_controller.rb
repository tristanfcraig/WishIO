class ItemsController < ApplicationController
 
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

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
