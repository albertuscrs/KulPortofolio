class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
    layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

def index
    @portfolio_items = Portfolio.all
end

def angular
    @angular_portfolio_items = Portfolio.angular
end

def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
end

def create
    @portfolio_item = Portfolio.new(portfolios_params)

    respond_to do |format|
    if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is live now.' }
    else
        format.html { render :new }
    end
    end
end

def edit
    #@portfolio_item = Portfolio.find(params[:id])
end

def update
    #@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
        if @portfolio_item.update(portfolios_params)
            format.html { redirect_to portfolios_path, notice: 'The record successfully updated.'}
        else
            format.html { render :edit }
        end
    end
end

def show
    #binding.pry need gem 
    #@portfolio_item = Portfolio.find(params[:id])
end

def destroy
    #perform lookup
    @portfolio_item = Portfolio.find(params[:id])
    #destroy
    @portfolio_item.destroy
    respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Record was successfully removed.' }
    end
end

# semua yg di bawah ini adalah private, hanya bisa diakses di controller ini
private
def portfolios_params
    params.require(:portfolio).permit(:title, 
                                    :subtitle, 
                                    :body,
                                    :image, 
                                    technologies_attributes: [:name]
                                    )
end

def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
end

end
