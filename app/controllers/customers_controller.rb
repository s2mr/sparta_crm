class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :before_action, only: [:edit, :update, :show, :destroy]
  
  def index
    @q = Customer.includes(:post, :company).ransack(params[:q])
    @customers = @q.result.page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    # @customer = Customer.new(customer_params)
    # @customer.save  これだと保存できていなくてもshowに飛ばされる
    # redirect_to @customer
    
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update customer_params
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end
  
  private
  
  def before_action
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :email, :company_id, :post_id)
  end
end
