class ProjectsController < ApplicationController
  #skip_before_action :authenticate_user!
  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search])
      puts "#{params[:search]}"
    else
      @users = User.all
    end
  end
  
end



