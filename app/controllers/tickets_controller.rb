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
      
      @ticket_params = params.require(:offer).permit(:offer_id,:user_id)
      @ticket = Ticket.new(@ticket_params)
      @offer = Offer.find(@ticket.offer_id)

      if @offer.number_of_seats < 1
        redirect_to root_path
        flash[:warning] = "No seats left."

       elsif @ticket.save 
         @offer.number_of_seats -=1
          @offer.save
         flash[:success] = "Ticekt bought"
         redirect_to root_path

       else
         render 'new'
      end
      
    end

end
