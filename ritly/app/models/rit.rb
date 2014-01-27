class Rit < ActiveRecord::Base

	def self.url_taken? url
		!find_by(entered_url: url).nil?
	end

	def self.create_new url
		short = SecureRandom.urlsafe_base64(3)
		create(entered_url: url, short_url: short, visited: 0)
	end

	def has_custom?
		self.custom_url != nil
	end

	def self.find_url url
		if !find_by(short_url: url).nil?
			return find_by(short_url: url)
		elsif !find_by(custom_url: url).nil?
			return find_by(custom_url: url)
		end
	end

	def fix_url
		if self.entered_url.match(/^http/) == nil
			self.update_attributes(entered_url: "http://#{self.entered_url}")
			return self
		else
			return self
		end
	end

	def add_one
		self.update_attributes(visited: visited+1)
		return self
	end

	def update url, custom
		if custom == ""
			new_url = SecureRandom.urlsafe_base64(3)
			self.update_attributes(short_url: new_url)
			return self
		else
			self.update_attributes(custom_url: custom)
			return self
		end
	end

end