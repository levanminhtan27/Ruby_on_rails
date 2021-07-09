class User < ApplicationRecord
    has_secure_password

    validates_length_of :password,
   :minimum => 4 ,       
   :maximum => 7 ,     
   :in => 4..7,           
   :too_short => 'long 4 to 7',
   :too_long => 'long 4 to 7'
   
   validates :name, presence: true

   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
   :message => 'chưa đúng định dạng' 
end
