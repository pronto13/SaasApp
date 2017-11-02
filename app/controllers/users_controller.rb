class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # Combine user table into one query as opposed to all. individual query (heavy on the server)
    # Check log to compare request between includes and all
    # also check out sql join - active record querying
    @users = User.includes(:profile)
  end 
  
  # GET to /users/:id
  def show
    @user = User.find(params[:id])
  end
  
end