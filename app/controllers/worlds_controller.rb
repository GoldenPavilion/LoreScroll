class WorldsController < ApplicationController
    before_action :require_login
    before_action :created_by_user, only: [:edit, :update]

    def index
        @worlds = World.most_recent
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

    def created_by_user
        @world = World.find_by(id: params[:id])
        unless @world.user_id.to_i == current_user.id
            flash[:notify] = "Cannot edit content you did not create."
            redirect_to world_path(@world)
        end
    end
end