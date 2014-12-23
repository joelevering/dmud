class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "YATTA"
      redirect_to @item
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      flash[:success] = "YATTA"
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy!
      flash[:success] = "Item deleted"
      redirect_to items_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :owner_id, :owner_type)
  end
end

