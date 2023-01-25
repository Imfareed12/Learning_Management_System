class Admin::DashboardController < Admin::MainController
	before_action :authenticate_admin!
	def index
	end
end
