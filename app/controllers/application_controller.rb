class ApplicationController < ActionController::Base
	def disable_nav
  	@disable_nav = true
	end

	def disable_footer
  	@disable_footer = true
	end
end
