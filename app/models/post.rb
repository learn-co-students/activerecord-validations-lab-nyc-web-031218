class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Non-Fiction", "Fiction"] }
  validate :check_clickbait

  CLICKBAIT = [/Won't believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def check_clickbait
    if !CLICKBAIT.any? { |c| c.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
