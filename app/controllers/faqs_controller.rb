class FaqsController < ApplicationController
  def index
  end

  def new
    @faq = Faq.new if current_user.admin
  end

  def show
  end

  def create
    @faq = Faq.new(faq_params)

    if @faq.save

      flash[:notice] = "Hop un nouveau contenu dans la besace"
      redirect_to pages_FAQ_path
    else
      redirect_to pages_admin_path
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to pages_FAQ_path
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
    redirect_to pages_FAQ_path
    else
      render :new
    end
  end

  private

  def faq_params
    params.require(:faq).permit(:theme, :question, :contenu, :photo, :photo_cache)
  end
end
