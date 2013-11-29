class TestsController < ApplicationController


	def test
		render text: Time.now
	end

end