class IdeasController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_idea, only: [:show, :edit, :update, :destroy]


    def new
        @idea = Idea.new
    end

    def create
        # render json: params

        @idea = Idea.new ideas_params

        @idea.user = current_user

        if @idea.save
            # render json: @idea

            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end

    def show
        @review = Review.new
        @reviews = @idea.reviews.order(created_at: :desc)
    end

    def edit
    end
    
    def update 
        if @idea.update(ideas_params)
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end

    def index 
        @ideas = Idea.all.order(created_at: :desc)
        # render json: @ideas
    end
    

    private

    def ideas_params
        params.require(:idea).permit(:title, :description)
    end

    def find_idea
        @idea = Idea.find params[:id]
    end
end
