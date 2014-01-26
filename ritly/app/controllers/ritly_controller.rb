class RitlyController < ApplicationController

	def index
		@table = Rit.all
	end

	def create
		given_url = params[:orig_url]
		if Rit.url_taken?(given_url)
			@error = "The URL you entered is not available"
			redirect_to index_path
		else 
			shortened_url = SecureRandom.urlsafe_base64(3)
			Rit.create_new(given_url, shortened_url)
			redirect_to show_path(shortened_url)
		end
	end

	def show
		shortened_url = params[:url]
		@list = Rit.all
		@page = Rit.find_by(short_url: shortened_url)
	end

	def go
		rit = params[:url]
		link = Rit.find_by(short_url:rit)
		redirect_to "https://#{link.entered_url}"
	end

	# def update
	# 	shortened_url = params[:url]
	# 	custom = params[:cust_url]
	# 	link_page = Rit.find_by(short_url: shortened_url)
	# 	if link_page.has_custom?
	# 		new_url = SecureRandom.urlsafe_base64(3)
	# 		link_page.update_attributes(short_url: new_url)
	# 		redirect_to show_path(new_url)
	# 	else
	# 		link_page.update_attributes(custom_url: custom)
	# 		redirect_to show_path(shortened_url)
	# 	end
	# end

	# model method: has_url?  check to see if url exists.  if so return true


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