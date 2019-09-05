module Admin
  class ApplicationController < ::ApplicationController

    before_action :only_admin

    private

    def only_admin
      unless user_signed_in? && current_user.admin == true
        flash[:danger] = 'You\'re not allowed on this page'
        redirect_to items_path
      end
    end
  end

end