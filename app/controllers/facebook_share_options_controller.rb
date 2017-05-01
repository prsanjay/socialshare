class FacebookShareOptionsController < ApplicationController
  def index
    @users = User.all
  end

  def share_link

    url = params[:url]
    users = User.where('uid != ?',ENV['FB_UID'])
    begin
      users.each do |user|
        graph = Koala::Facebook::API.new(user.long_term_token)

        response = graph.put_wall_post("", {link: "#{url}"})
      end
      flash[:notice] = "Link Shared Successfully!"
    rescue Exception => e
      flash[:notice] = "Something Went Wrong. Here it is: #{e}"
    end
    redirect_to '/'
  end
end



