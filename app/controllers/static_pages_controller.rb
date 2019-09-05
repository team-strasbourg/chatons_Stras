class StaticPagesController < ApplicationController
before_action :disable_nav, only: [:welcome_page]
before_action :disable_footer, only: [:welcome_page]
def about

end

def contact
end

def terms_of_use
end

def welcome_page
	@disable_nav = true
	@disable_footer = true
end
end