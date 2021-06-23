class StoriesController < ApplicationController

    def index
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to story_path(@story)
        else
            flash[:notify] = "Something went wrong. Try again!"
            redirect_to new_story_path
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
        @user = User.find_by(id: current_user.id)
        @story.destroy
        redirect_to user_path(@user)
    private

    def story_params
        params.require(:story).permit(:title, :summary, :world_id)
    end

end