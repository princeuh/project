module InvestorsHelper
	def gravatar_for(investor, size: 80)
    	gravatar_id = Digest::MD5::hexdigest(investor.email.downcase)
    	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    	image_tag(gravatar_url, alt: investor.firstname, class: "gravatar")
  	end
end
