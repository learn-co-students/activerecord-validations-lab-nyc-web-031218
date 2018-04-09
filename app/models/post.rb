class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :is_clickbait

  private

  def is_clickbait
    array = ["Won't Believe", "Secret", "Top", "Guess"]
    selected_clickbait = []

    array.each do |string|
      if title
        if title.include?(string)
          selected_clickbait << string
        end
      end
    end

    if selected_clickbait.empty?
      errors.add(:title, "Not clickbait")
    end
  end
end
