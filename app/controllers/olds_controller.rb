class OldsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_viager, only: [ :create ]
  def index
  end

  def new
  end

  def show
  end



  def create

    @old = Old.new(old_params)
    @old.save
    @viager.old_id = @old.id
    @viager.save
    if @old.save
      flash[:notice] = "Papy a été ajouté"
      redirect_to viager_path(@viager)
    else
      redirect_to pages_admin_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

   private

  def set_viager
    @viager = Viager.find(params[:old][:viager_id].to_i)
  end

  def old_params
    params.require(:old).permit(:age, :lifespan, :first_name, :last_name, :descriptif, :projet, :sexe)

  end

end
