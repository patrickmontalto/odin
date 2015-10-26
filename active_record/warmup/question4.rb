####
Post

id: integer
link: string [presence]
user_id: integer

belongs_to :user
has_many :comments

####
Comment

id: integer
body: text [presence]
user_id: integer
post_id: integer
comment_id: integer

belongs_to: post
belongs_to_and_has_many: comments
belongs_to: user

####
User
id: integer

has_many :comments
has_many :posts

####