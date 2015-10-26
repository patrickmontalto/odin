####
Courses
id: integer
title: string [present, unique]
description: text [present]

has_many: lessons

####
Lessons
id: integer
title: string [present]
body: text [present]
course_id: integer

belongs_to: course

####