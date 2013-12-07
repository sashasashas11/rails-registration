module ApplicationHelper
	def setup_user(user)
		returning(user) do |p|
			p.address.build if p.address.empty?
		end
	end
end
