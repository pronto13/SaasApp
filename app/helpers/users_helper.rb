# You can put all sort of misc function here
# can inject instance variable from controllers

module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Bum"
      "<i class ='fa fa-child'></i>".html_safe
    elsif @user.profile.job_title == "Hobo"
      "<i class ='fa fa-child'></i>".html_safe
    elsif @user.profile.job_title == "Rich People"
      "<i class = 'fa fa-dollar'></i>".html_safe
    end  
  end
end