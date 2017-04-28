class FacebookShareOptionsController < ApplicationController
  def index
    @users = User.all
  end

  def share_link

    url = params[:url]

    begin
      User.all.each do |user|
        graph = Koala::Facebook::API.new(user.oauth_token)

        response = graph.put_wall_post("", {link: "#{url}"})
      end
      flash[:notice] = "Link Shared Successfully!"
    rescue Exception => e
      flash[:notice] = "Something Went Wrong. Here it is: #{e}"
    end
    redirect_to '/'
  end
end



