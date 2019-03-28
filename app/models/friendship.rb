class Friendship < ApplicationRecord

    belongs_to :user
    # It means "friend" is the same users table 
    # We need it for making the friends assotiation
    belongs_to :friend, :class_name => 'User'

end
