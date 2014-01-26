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

	def fix_url
		gsub1 = /^http:\/\//
		gsub2 = /^https:\/\//
		if !self.entered_url.match(gsub1) || !self.entered_url.match(gsub2)
			self.update_attributes(entered_url: "http://#{self.entered_url}")
		end
	end

end