class StoriesController < ApplicationController
    before_action :require_login
    before_action :created_by_user, only: [:edit, :update]

    def index
        @stories = Story.all
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to story_path(@story)
        else
            render 'new'
        end
    end

    def show
        @story = Story.find_by_id(params[:id])
    end

    def edit
        @story = Story.find_by_id(params[:id])
    end

    def update
        @story = Story.find_by_id(params[:id])
        @story.update(story_params)
        redirect_to story_path(@story)
    end

    def destroy
        @story = Story.find_by_id(params[:id])
        @story.destroy
        redirect_to user_path(@story.user)
    end

    private

    def story_params
        params.require(:story).permit(:title, :medium, :summary, :user_id)
    end
    
    def created_by_user
        @story = Story.find_by(id: params[:id])
        unless @story.user_id.to_i == current_user.id
            flash[:notify] = "You cannot edit a story you did not create."
            redirect_to stories_path
        end
    end
end