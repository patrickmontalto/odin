####
User
id: integer
username: string [present, length, uniqueness]
email: string  [present, format, uniqueness]

has_one: profile

####
Profile
id: integer
user_id: integer
city: string
state: string
country: string
age: integer
gender: boolean

belongs_to: user
####
