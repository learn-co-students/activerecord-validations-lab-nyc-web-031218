class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait

  def is_clickbait
    clickbait = [/won't believe/i, /secret/i, /guess/i, /top [0-9]*/i]

    if !clickbait.any? { |phrase| phrase.match(title) }
      errors.add(:title, "must have clickbait title")
    end
    
  end
end
