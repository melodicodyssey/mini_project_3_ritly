class RitlyController < ApplicationController

	def index
	end


	def create
		given_url = params[:url]
		shortened_url = SecureRandom.urlsafe_base64(3)
		Rit.create(entered_url: given_url, short_url: shortened_url, visited: 0)
		redirect_to "/ritly/show/#{shortened_url}"
	end

	def show
		@list = Rit.all
		shortened_url = params[:url]
		@page = Rit.find_by(short_url: shortened_url)
	end

	def go
		rit = params[:url]
		link = Rit.find_by(short_url:rit)
		redirect_to "https://#{link.entered_url}"
	end

	# def update
	# 	shortened_url = params[:url]
	# 	page = Rit.find_by(short_url: shortened_url)
	# 	new_url = SecureRandom.urlsafe_base64(3)
	# 	page.update_attributes(short_url: new_url)
	# 	redirect_to show_path(shortened_url)
	# end


end

# post to CREATE first, then redirect to /SHOW/:url


# is there a way to 'test' the url by redirecting to it immediately..
# and then taking the next action based on the server response (200, 404, 500)

=begin

index.erb -->  @site ---> show ----->  @new_url ----> show.erb ----> go
(site)					(new_url)


LINKS TABLE
id 		entered_url		short_url		custom_url		visited		created_at	updated_at		
---		---------		---------		----------		-------		----------	----------





TRACKER TABLE
id 			url_name	created_at		updated_at

1			9587sfg4	time				time
			same		time				time
			






=end