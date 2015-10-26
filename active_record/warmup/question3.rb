####
Pin
id: integer
image_url: string [present, format]

has_many: comments

####
Comment
id: integer
pin_id: integer
user_id: integer

belongs_to :user
belongs to :pin

####
User

has_many: comments
has_many: pins