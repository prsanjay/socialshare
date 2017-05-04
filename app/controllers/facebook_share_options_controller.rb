class FacebookShareOptionsController < ApplicationController
  def index
    @users = User.where('provider=?','facebook')
  end


  def share_link

    url = params[:url]
    users = User.where('uid != ? and provider=?',ENV['FB_UID'],'facebook')
    begin
      users.each do |user|
        graph = Koala::Facebook::API.new(user.long_term_token)

        response = graph.put_wall_post("", {link: "#{url}"})
      end
      flash[:notice] = "Link Shared Successfully!"
    rescue Exception => e
      flash[:notice] = "Something Went Wrong. Here it is: #{e}"
    end
    redirect_to facebook_page_path
  end
end



