class SubscribersController < ApplicationController
  # http_basic_authenticate_with name: "huy", password: "huy", except: [:create]
  before_action :admin_authorize, :only => [:destroy]

  def index
    @subscribers = Subscriber.all
  end

  def create
    @subscribers = Subscriber.new(subscriber_params)
    if Subscriber.exists?(email: @subscribers.email)
      redirect_to root_path, alert: 'Sorry, that email allready exists!'
    elsif @subscribers.save
      redirect_to root_path, notice: "Thank you #{@subscribers.f_name}, for subscribing to my Newsletter!"
    else
      redirect_to root_path, alert: "Sorry, I failed to save your information. Please try again!"
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    redirect_to subscribers_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
  end

end
