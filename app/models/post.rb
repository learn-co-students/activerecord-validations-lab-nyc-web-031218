class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} if not a valid category"}
  validate :check_clickbait

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i,/Guess/i]


  def check_clickbait
    if !CLICKBAINT.any? do |c|
      c.match title
    end

    errors.add(:title, "must be clickbait")
    end

  end
end
