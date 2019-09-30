#The controller has a direct line of communication with the view.
#When creating a controller from scratch, make sure the function name is the same as the views file name.


class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
  layout "portfolio"
  #everyone has access to show and index. regular user cannot destroy, update, and create. site_admin can do everything.
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  #index action shows all portfolio items in ascending order
  #@ symbol makes it an instance variable in order to access it in the views and controller file. 
  #if no @ symbol it will only be accessed in the method, not other files.
  def index 
    @portfolio_items = Portfolio.by_position
  end
  
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    #tells Ruby that we are all done and that there is no view file for this method.
    render nothing: true
  end

  #new action only renders the item, it does not create it. 
  #@ allowed us to created a new instance of the portfolio and made it available to the form.
  def new 
    @portfolio_item = Portfolio.new
    #creates three types of technologies and makes it available to the form.
    3.times {@portfolio_item.technologies.build}
  end

  #create action creates a portfolio item
  def create
    #specifying the parameters that are allowed to go through the system.
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        #if the item is successfully created, portfolio_path leads to the full list of portfolio items.
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
  end
  
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end


  def destroy
    #destroy/delete record
    @portfolio_item.destroy
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was deleted' }
    end
  end

  #private is a way to organize our methods. private methods can only be used inside this specific class.
  private
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:name]
                                        )

  end
  
  def set_portfolio_item
    #perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
  end

end
