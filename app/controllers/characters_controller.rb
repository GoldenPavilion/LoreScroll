class CharactersController < ApplicationController

    def index
        if params[:story_id]
            @characters = Story.find(params[:story_id]).characters
        else
            @characters = Character.all
        end
    end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)
        @world = World.find_by(id: @character.world_id)
        if @character.save
            redirect_to world_character_path(@world, @character)
        else
            flash[:notice] = "A character must have a name, setting and story."
            redirect_to new_character_path
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
        @world = World.find_by(id: @character.world_id)
        redirect_to world_character_path(@world, @character)
    end

    def destroy
        @character = Character.find_by_id(params[:id])
        @character.destroy
        redirect_to world_characters_path(@character.world)
    end

    private

    def character_params
        params.require(:character).permit(:name, :role, :age, :gender, :species, :job, :physical, :description, :motivation, :world_id, :story_id)
    end

end