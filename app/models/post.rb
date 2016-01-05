class Post < ActiveRecord::Base

	validates :title,
	presence: true,
	length: { minimum: 10, maximum: 100 }

	# validates :link, format: { :with => /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ },
	validates :link, 
	presence: true,
	url: true

  	belongs_to :user

end

