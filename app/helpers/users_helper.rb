# You can put all sort of misc function here
# can inject instance variable from controllers

module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Job1"
      "<i class ='fa fa-dollar'></i>".html_safe
    elsif @user.profile.job_title == "Job2"
      "<i class ='fa fa-dollar'></i>".html_safe
    elsif @user.profile.job_title == "Job3"
      "<i class = 'fa fa-dollar'></i>".html_safe
    end  
  end
end