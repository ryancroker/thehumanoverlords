class User < ActiveRecord::Base
	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("users.id ASC") }
	scope :newest_first, lambda { order(users.created_at DESC)}
	scope :search, lambda {|query| 
		where("user_name LIKE?", "%#{query}")}

	
end
