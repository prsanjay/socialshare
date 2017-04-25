class FacebookShareOptionsController < ApplicationController
  def index
  end

  def share_link
    access_token_1 = "access token of user 1"

    access_token_2 = "access token of user 2"

    access_token_3 = "access token of user 3"

    users_tokens = [access_token_1,access_token_2,access_token_3]

    url = "https://sanjayprajapati.herokuapp.com/"

    begin
      users_tokens.each do |user_token|
        graph = Koala::Facebook::API.new(user_token)

        response = graph.put_wall_post("", {link: "#{url}"})
      end
      flash[:notice] = "Link Shared Successfully!"
    rescue Exception => e
      flash[:notice] = "Something Went Wrong. Here it is: #{e}"
    end
    redirect_to '/'
  end
end



