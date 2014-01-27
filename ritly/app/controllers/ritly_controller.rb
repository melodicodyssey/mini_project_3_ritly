class RitlyController < ApplicationController

	def index
		@list = Rit.all
	end

	def create
		given_url = params[:orig_url]
		if Rit.url_taken?(given_url)
			flash[:in_use] = "The URL you entered is already in use"
			redirect_to index_path
		else 
			new_entry = Rit.create_new(given_url).fix_url
			redirect_to show_path(new_entry.short_url)
		end

	end

	def show
		shortened_url = params[:url]
		@list = Rit.all
		@page = Rit.find_by(short_url: shortened_url).fix_url
	end

	def go
		url = params[:url]
		link = Rit.find_url(url).add_one
		redirect_to "#{link.entered_url}"
	end

	def update
		url = params[:url]
		custom = params[:cust_url]
		link = Rit.find_by(short_url: url).update(url, custom)
		redirect_to show_path(link.short_url)
	end

	def delete
		id = params[:id]
		link = Rit.find(id)
		Rit.destroy(link)
		redirect_to index_path
	end

end



# <%= localize(link.created_at, format: :long)%>

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