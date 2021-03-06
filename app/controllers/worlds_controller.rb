class WorldsController < ApplicationController
    before_action :require_login
    before_action only: [:edit, :update] do
        authorize_to_edit(World)
    end

    def index
        if params[:search]
            @worlds = World.search(params[:search]).most_recent
        else    
            @worlds = World.most_recent
        end

    end

    def new
        @world = World.new
    end

    def create
        @world = current_user.worlds.build(world_params)
        if @world.save
            redirect_to world_path(@world)
        else
            render 'new'
        end
    end

    def show
        @world = World.find_by(id: params[:id]) 
    end


    def edit
        @world = World.find_by(id: params[:id])
    end

    def update
        @world = World.find_by(id: params[:id])
        @world.update(world_params)
        redirect_to world_path(@world)
    end

    def destroy
        @world = World.find_by_id(params[:id])
        @world.destroy
        redirect_to user_path(current_user)
    end

    private

    def world_params
        params.require(:world).permit(:name, :scale, :description, :user_id)
    end

end