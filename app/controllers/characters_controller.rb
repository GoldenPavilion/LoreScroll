class CharactersController < ApplicationController

    def index
        if params[:world_id]
            @characters = World.find(params[:world_id]).characters
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
            redirect_to new_character_path
        end
    end

    def show
        @character = Character.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    private

    def character_params
        params.require(:character).permit(:name, :role, :age, :gender, :species, :job, :physical, :description, :motivation, :world_id)
    end

end