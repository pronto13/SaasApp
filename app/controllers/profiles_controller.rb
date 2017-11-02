class ProfilesController < ApplicationController

  # GET to /users/:user_id/profile/new
  def new
    # Create a blank list in the machine memory
    @profile = Profile.new
    
  end
end