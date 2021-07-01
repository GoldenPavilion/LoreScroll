class CharactersController < ApplicationController
    before_action :require_login
    before_action :created_by_user, only: [:edit, :update]

    def index
        if params[:story_id]
            @characters = Story.find(params[:story_id]).characters.order_by_role
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
        if @character.save
            redirect_to story_characters_path(@character.story)
        else
            render 'new'
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

    private

    def character_params
        params.require(:character).permit(:name, :role, :age, :gender, :species, :job, :physical, :description, :motivation, :world_id, :story_id)
    end

    def created_by_user
        @character = Character.find_by(id: params[:id])
        unless @character.story.user_id.to_i == current_user.id
            flash[:notify] = "You cannot edit a character you did not create."
            redirect_to story_characters_path(@character.story)
        end
    end
    
end