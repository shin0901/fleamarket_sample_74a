class UsersController < ApplicationController
  
  def index
    
  end

  def show
    @card = current_user.id
    card = Creditcard.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: :new
    end
  end

  def delete

  end

  protected

  
end
