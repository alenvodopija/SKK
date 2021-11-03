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
      if @ticket.save
        flash[:success] = "Ticket bought."
        redirect_to root_path
    else
         render 'new'
    end
    end
end
