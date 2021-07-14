class CharactersController < ApplicationController
    before_action :require_login
    before_action only: [:edit, :update] do
        authorize_to_edit(Character, :story)
    end

    def index
        if params[:story_id]
            @characters = Story.find(params[:story_id]).characters.order_by_role
            @story = Story.find(params[:story_id])
        else
            @characters = Character.all
        end
    end

    def new
        @story = Story.find_by_id(params[:story_id])
        @character = @story.characters.build
    end

    def create
        @character = Character.new(character_params)
        if current_user.stories.ids.include?(params[:character][:story_id].to_i)
            if @character.save
                redirect_to story_character_path(@character.story, @character)
            else
                render 'new'
            end
        else
            flash[:notify] = "You cannot add a character to someone else's story."
            redirect_to stories_path
        end
    end

    def show
        @character = Character.find_by(id: params[:id])
    end

    def edit
        @character = Character.find_by(id: params[:id])
    end

    def update
        @character = Character.find_by(id: params[:id])
        @character.update(character_params)
        redirect_to story_character_path(@character.story, @character)
    end

    def destroy
        @character = Character.find_by_id(params[:id])
        @character.destroy
        redirect_to story_characters_path(@character.story)
    end

    def main_characters
        @characters = Character.main_characters
        render :index
    end

    private

    def character_params
        params.require(:character).permit(:name, :role, :age, :gender, :species, :job, :physical, :description, :motivation, :world_id, :story_id)
    end
    
end