class HomeController < ApplicationController
  def index
    if current_user.present?
      provider = current_user.provider
      case provider
      when 'linkedin'
        redirect_to linked_page_path
      when 'facebook'
        redirect_to facebook_page_path
      else
        redirect_to root_url
      end
    end
  end
end
