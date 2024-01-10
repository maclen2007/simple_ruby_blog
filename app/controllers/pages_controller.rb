class PagesController < ApplicationController
    
    def about
    end

    def send_form
      @email_params = {'email' => params[:email], 'phone' => params[:phone], 'message' => params[:message]}
      flash[:notice] = "Сообщение отправлено"
      ContactMailer.send_email(@email_params).deliver_now
      redirect_to contact_path
    end    
    
end
