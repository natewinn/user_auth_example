class ItemsController < ApplicationController
  # before_filter :authenticate_user!

  before_filter :load

  def load
  	@items = Item.all
    @new_item = Item.new
  end

  def index
  end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path, notice: "Item added."
		else
			redirect_to :back, alert: "Failed to save."
		end
	end

	private

	def item_params
		params.require(:item).permit!
	end
end