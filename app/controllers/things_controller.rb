class ThingsController < ApplicationController
  respond_to :json

  def show
    @things = Thing.find_closest(params[:lat], params[:lng], params[:limit] || 10)
    unless @things.blank?
      respond_with @things
    else
      render(:json => {"errors" => {"address" => [t("errors.not_found", :thing => t("defaults.thing"))]}}, :status => 404)
    end
  end

  def update
    puts params
    @thing = Thing.find(params[:id])
    @user = User.find(current_user.id)
    @thing.users << @user
    @thing.save
    respond_with @thing
    # TODO: Figure out what an error would be
    # else
    #   render(:json => {"errors" => @thing.errors}, :status => 500)
    # end
  end
end
