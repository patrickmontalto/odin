# A post can have 1 author and 1 editor.
users table
id :integer
username :string

posts table
id :integer
title :string
body :text
author_id :integer
editor_id :integer

class User < ActiveRecord::Base
  has_many :authored_posts, :class_name => "Post", :foreign_key => "author_id"
  has_many :edited_posts, :class_name => "Post", :foreign_key => "editor_id"
end

class Post < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :editor, :class_name => "User"
end

# A post can have multiple authors and 1 editor
users table
id :integer
username :string

posts table
id :integer
title :string
body :text
editor_id :integer

post_authorings table
authored_post_id :integer
post_author_id :integer

class User < ActiveRecord::Base
  has_many :post_authorings, :foreign_key => :post_author_id
  has_many :authored_posts, :through => :post_authoring
  has_many :edited_posts, :class_name => "Post", :foreign_key => "editor_id"
end

class Post < ActiveRecord::Base
  has_many :post_authorings, :foreign_key => :authored_post_id
  has_many :authors, :through => :post_authorings, :source => :post_author
  belongs_to :editor, :class_name => "User"
end

class PostAuthroing < ActiveRecord::Base
  belongs_to :post_author, :class_name => "User"
  belongs_to :authored_post, :class_name => "Post"
end

# A site for pet-sitting (watching someone's pet while they're gone). 
# People can babysit for multiple pets and pets can have multiple petsitters.
users table
id :integer
first_name :string
last_name :string
address :string
created_at :datetime
updated_at :datetime

pets table
id :integer
name :integer
owner :integer
created_at :datetime
updated_at :datetime

pet_sittings table
id :integer
sitter :integer (user_id)
pet :integer (pet_id)
created_at :datetime
updated_at :datetime

class User < ActiveRecord::Base
  has_many :petsittings, :foreign_key => sitter_id
  has_many :sit_pets, :through => :pet_sittings, :source => :pet
end

class Pet < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :pet_sittings, :foreign_key => pet_id
  has_many :sitters, :through => :pet_sittings
end

class PetSitting < ActiveRecord::Base
  belongs_to :sitter, :class_name => "User"
  belongs_to :pet, :class_name => "Pet"
end


# You like hosting people for dinner so you want to build a dinner party invitation site. 
# A user can create parties, invite people to a party, and accept an invitation to someone else's party.

users table
id :integer
first_name :string
last_name :string
address :string
created_at :datetime
updated_at :datetime

parties table
id :integer
location :string
time :datetime
user :integer
created_at :datetime
updated_at :datetime

party_invites table
id :integer
party_id :integer
inviter_id :integer (user_id)
invitee_id :integer (user_id)
created_at :datetime
updated_at :datetime
attending :boolean

class User < ActiveRecord::Base
  has_many :parties
  has_many :party_invites, :foreign_key => inviter_id
end

class Party < ActiveRecord::Base
  has_many :invites, :class_name => "PartyInvite"
  has_many :invitees, :through => :invites
  has_many :inviters, :through => :invites
end

class PartyInvite < ActiveRecord::Base
  belongs_to :party
  belongs_to :inviter, :class_name => "User"
  belongs_to :invitee, :class_name => "User"
end


# Extra credit (tricky): You and your friends just love posting things and following each other. 
# How would you set up the models so a user can follow another user?


user table
id :integer
username :string

relationships table
follower_id :integer
followed_id :integer

class User < ActiveRecord::Base
  has_many :active_relationships, :class_name => "Relationship",
                                  :foreign_key => "follower_id"
                                  dependent: :destroy
  has_many :passive_relationships, :class_name => "Relationship",
                                   :foreign_key => "followed_id",
                                   dependent: :destroy
  has_many :following, :through => :active_relationships, source: :followed
  has_many :followers, :through => :passive_relationships
end

class UserFollowings < ActiveRecord::Base
  belongs_to :follower, :class_name => "User"
  belongs_to :followed, :class_name => "User"
end












