class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_seller
  before_action :sold_item
  before_action :set_item, only: [:index, :create]

  def index
    @transaction = TransactionForm.new
  end

  def create
    @transaction = TransactionForm.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def transaction_params
    params.require(:transaction_form).permit(:postal_code, :area_id, :city, :block_number, :building,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end

  def check_seller
    if current_user.id == Item.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  def sold_item
    if Item.find(params[:id]).purchase
      redirect_to root_path
    end
  end
end
