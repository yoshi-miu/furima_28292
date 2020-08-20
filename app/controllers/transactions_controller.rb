class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:id])
  end
end
