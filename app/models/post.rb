class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "Not a valid category." }
  validate :clickbait

  def clickbait
    # if !self.title =~ /^(Won't Believe|Secret|Top[number]|Guess)$/
    #   errors.add(:title, "is not clickbait")
    # end

    # if !%w(Won't Believe Secret Top[number] Guess)
    #   errors.add(:title, "is not clickbait")
    # end

    if ![/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i].any? { |cb| cb.match title }
        errors.add(:title, "is not clickbait")
    end

  end


end
