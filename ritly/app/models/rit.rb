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

end