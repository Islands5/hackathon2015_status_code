class HomeController < ApplicationController
	def index

	end

  def check
    if current_user.present?
    end
  end
end
