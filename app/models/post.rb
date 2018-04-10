class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %W(Fiction Non-Fiction)}
 validate :is_clickbait?


#this is the worst ruby code I've ever written. I'm sorry. I'm so sorry.
  def is_clickbait?
    if self.title
      clickbait_titles = ["Won't Believe", "Secret", "Top", "Guess"]
      if !clickbait_titles.any? {|cb| self.title.include?(cb)}
        errors.add(:title, "no click bait")
      end
    end
  end

end
