class LinkedinSharesController < ApplicationController
  before_action :get_users

  def index
  end

  def share_link
    url,caption = params[:url],params[:caption]
    headers = {'Content-Type' => 'application/json','x-li-format' => 'json'}
    data = {
        body: {
            "comment"=>"#{caption}",
            "content"=> {
                "description"=> "",
                "submitted-url"=> "#{url}"
              },
              "visibility"=> {
                "code"=> "anyone"
              }
        }.to_json,
        :headers => headers
    }

    begin
      @users.each do |user|
        api_url = "https://api.linkedin.com/v1/people/~/shares?format=json&oauth2_access_token=#{user.oauth_token}"
        response = HTTParty.post(api_url,data)
      end
      flash[:notice] = "Link Shared Successfully!"
    rescue Exception => e
      flash[:notice] = "Something Went Wrong. Here it is: #{e}"
    end
    redirect_to linked_page_path
  end

  private
   def get_users
    @users = User.where('provider=?','linkedin')
   end
end
