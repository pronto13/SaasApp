class ProfilesController < ApplicationController
  # Securing User Pages, before_action :authenticate user! provided by devise
  # You can limit the before_action by using 'only' so only listed action gets authenticated
  # before_action :authenticate_user!, only [:action1, :action2]
  before_action :authenticate_user!
  # Prevent an user to edit another user's profile, need to create a new function for it see line56
  before_action :only_current_user
  # GET to /users/:user_id/profile/new
  def new
    # Create a blank list in the machine memory
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(params[:user_id])
    else
      render action :new
    end
  end
  
  # GET to/users/:user_id/profile/edit
  def edit
    # Retrieve existing profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
  
  # PUT/PATCH to /users/:user_id/profile
  def update
    # Retrieve the user from the db
    @user = User.find(params[:user_id])
    # Retrieve the user's profile
    @profile = @user.profile
    # Mass assign edited profile attributes and save it (update)
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id])
    else
      render action :edit
    end
    
  end
  
  # Whitelist the form fields
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    
  def only_current_user
    @user = User.find(params[:user_id])
    # Go to homepage if the current_user(devise function) isn't matched
    redirect_to(root_url) unless @user == current_user
  end
end