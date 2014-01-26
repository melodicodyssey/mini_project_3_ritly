class Rit < ActiveRecord::Base

	def self.url_taken? url
		!find_by(entered_url: url).nil?
	end

	def self.create_new long, short
		create(entered_url: long, short_url: short, visited: 0)
	end

	def has_custom?
		!self.custom_url == nil
	end

	def self.find_url url
		if !find_by(short_url: url).nil?
			return find_by(short_url: url)
		elsif !find_by(custom_url: url).nil?
			return find_by(custom_url: url)
		end
	end

end