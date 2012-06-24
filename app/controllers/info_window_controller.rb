class InfoWindowController < ApplicationController
  def index
    @thing = Thing.find_by_id(params[:thing_id], :include => {:affiliations => :user})

    if user_signed_in?
      @myAffiliation = Affiliation.find(:thing_id => @thing.id, :user_id => current_user.id)
      
      if @myAffiliation
        render("things/list_and_resign")
      else
        render("things/list_and_signup")
      end
    else
      render("things/list_and_invite")
    end

    # if @thing.affiliations_count?
    #   puts @thing.affiliations[0].user.inspect
    #   render("users/list")
    #   # if user_signed_in? && current_user.id == @thing.user_id
    #   #   render("users/thank_you")
    #   # else
    #   #   render("users/profile")
    #   # end
    # else
    #   if user_signed_in?
    #     render("things/adopt")
    #   else
    #     render("users/sign_in")
    #   end
    # end
  end
end
