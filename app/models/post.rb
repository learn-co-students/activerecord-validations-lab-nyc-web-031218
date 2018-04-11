class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-fiction"]

end


# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters

# t.string   "title"
# t.text     "content"
# t.text     "summary"
# t.string   "category"

#   is invalid without a title (FAILED - 1)
#   is invalid with too short content (FAILED - 2)
#   is invalid with a long summary (FAILED - 3)
#   is invalid with a category outside the choices (FAILED - 4)
#   is invalid if not clickbait (FAILED - 5)
