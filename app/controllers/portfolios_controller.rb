#The controller has a direct line of communication with the view.
#When creating a controller from scratch, make sure the function name is the same as the views file name.


class PortfoliosController < ApplicationController
    #index action shows all portfolio items
    #@ symbol makes it an instance variable in order to access it in the views and controller file. 
    #if no @ symbol it will only be accessed in the method, not other files.
    def index 
        @portfolio_items = Portfolio.all
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
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :substring, :body, technologies_attributes: [:name]))
    
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
        #looking for a specific portfolio item based on id to edit.
        @portfolio_item = Portfolio.find(params[:id])
    end
    
    def update
        @portfolio_item = Portfolio.find(params[:id])
        respond_to do |format|
            if @portfolio_item.update(params.require(:portfolio).permit(:title, :substring, :body))
                format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
                format.json { render :show, status: :ok, location: @blog }
            else
                format.html { render :edit }
                format.json { render json: @blog.errors, status: :unprocessable_entity }
            end
        end
    end


    def show
        #finds specific portfolio item to show.
        @portfolio_item = Portfolio.find(params[:id])
    end


    def destroy
        #perform the lookup
        @portfolio_item = Portfolio.find(params[:id])
        #destroy/delete record
        @portfolio_item.destroy
        #redirect
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'Record was deleted' }
        end
    end



end
