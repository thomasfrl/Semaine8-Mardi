class EmailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    if @email.read == false
       @email.update(read: true)     
    end
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{
      }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html{
        redirect_to root_path
      }
      format.js{
      }
    end 
  end


  private

  def email_params
    params.permit(:object, :body)
  end
end
