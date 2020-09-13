class CreditcardsController < ApplicationController
  require "payjp"
  before_action :move_to_root
  before_action :set_card, only: [:new, :show, :destroy, :buy, :pay ]
  before_action :set_product, only: [:buy, :pay]
  
  def new
    if @card.present?
      redirect_to creditcard_path(current_user.id)
    else
      card = Creditcard.where(user_id: current_user.id)
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params["payjp-token"].blank?
      redirect_to action: :new, alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        card: params["payjp-token"],
        metadata: {user_id: current_user.id},
        description: 'test'
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to regist_done_creditcards_path
      else
        redirect_to action: :new
      end
    end
  end

  def show
    card = Creditcard.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      case @card_info.brand
      when "Visa"
        @card_src = "image-visa.png"
      when "JCB"
        @card_src = "image-JCB.png"
      when "MasterCard"
        @card_src = "image-mastercard.png"
      when "American Express"
        @card_src = "image-AMERICAN.png"
      when "Diners Club"
        @card_src = "image-Diners.png"
      end
    end
  end

  def buy
    card = Creditcard.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    @address = Address.find(params[:id])
    if @card.blank?
    redirect_to action: :new
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      case @card_info.brand
      when "Visa"
        @card_src = "image-visa.png"
      when "JCB"
        @card_src = "image-JCB.png"
      when "MasterCard"
        @card_src = "image-mastercard.png"
      when "American Express"
        @card_src = "image-AMERICAN.png"
      when "Diners Club"
        @card_src = "image-Diners.png"
      end
    end
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    if Payjp::Charge.create(amount: @item.price, customer: customer, currency: 'jpy' )
      @item.update!(status: 1, buyer_id: current_user.id)
    else
      render action: :buy
    end
  end

  def destroy
    @card = Creditcard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      if @card.destroy
        redirect_to delete_done_creditcards_path
      else
        redirect_to creditcard_path(current_user.id), alert: "削除できませんでした。"
      end
    end
  end

  private

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def set_card
    @card = Creditcard.find_by(user_id: current_user.id)
  end

  def set_product
    @item = Product.find(params[:id])
  end

end
