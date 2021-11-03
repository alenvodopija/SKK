class TicketsController < ApplicationController

    def new
        if logged_in?
          @offer = Offer.find(params[:id])
          @user = User.find(session[:user_id]) if session[:user_id]
          render 'new': @user, @offer => :offer
        
        else
          redirect_to root_path
        end
      end

    def create
      @card_number_json = params.require(:offer).permit(:card_number)
      @card_number = @card_number_json['card_number']
      @ticket_params = params.require(:offer).permit(:offer_id,:user_id)
      @ticket = Ticket.new(@ticket_params)
      @offer = Offer.find(@ticket.offer_id)

      if @offer.number_of_seats < 1
        redirect_to root_path
        flash[:warning] = "No seats left."

       elsif @ticket.save &&  (@card_number_json['card_number'].to_i.digits.length() == 14)
         @offer.number_of_seats -=1
          @offer.save
         flash[:success] = "Ticekt bought"
         redirect_to root_path

       else
        redirect_to root_path
        flash[:danger] = "Please insert a 14 digit card number to buy a ticket."
      end
      
    end

end
