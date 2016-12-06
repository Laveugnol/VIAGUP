class ViagersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_viager, only: [ :show, :edit, :update, :destroy ]
  def index
    @viagers = Viager.all
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

   private

  def set_viager
    @viager = Viager.find(params[:id])
  end

end
