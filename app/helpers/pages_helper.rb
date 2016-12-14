module PagesHelper

  def step_1_done
    @user = current_user
    if @user.investment_profile
      return true
    else
      return false
    end
  end


end
