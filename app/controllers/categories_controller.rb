class CategoriesController < ApplicationController

    before_action :require_admin

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category created successfully!!!"
            redirect_to category_path(@category)
        else
            flash[:danger] = "There was some prones in your information!!!"
            render 'new'
        end
    end 

    def show
        @category = Category.find(params[:id])
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(category_params)
        if @category.save
            flash[:success] = "Category updated successfully!!!!"
            redirect_to category_path 
        else 
            flash[:danger] = "There was some prones with your information"
            render 'edit'
        end
    end




    private

        def category_params
            params.require(:category).permit(:title)
        end


end

