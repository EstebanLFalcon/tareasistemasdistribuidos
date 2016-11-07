class GpsSamplesController < ApplicationController

  def user_mobility
    @locations_json = params[:locations_json]
  end

  def post_user_mobility
    @user = User.where(:name => gps_params[:user_name]).first_or_create(:name => gps_params[:user_name])

    if(gps_params[:sample])
      @route = JSON.parse(gps_params[:sample].read)
      @route['route'].each do |location|
        Gps_sample.where(:users_id => @user.id,
                         :latitude=> location['latitude'],
                         :longitude => location['longitude']).first_or_create(
            :latitude => location['latitude'],
            :longitude => location['longitude'],
            :users_id => @user.id)
      end
    end

    @locations_json = Gps_sample.where(:users_id => @user.id).to_json

    render action: 'user_mobility', :locations_json => @locations_json
  end

  private
  def gps_params
    params.permit(:user_name, :sample)
  end
end