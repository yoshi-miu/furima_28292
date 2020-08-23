class TransactionsController < ApplicationController
  before_action :authenticate_user!
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
    @item = Item.find(params{:id})
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end
end
