class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: :valid_categories}
  validate  :clickbait

  def valid_categories
    ["Fiction", "Non-fiction"]
  end

  def clickbait
    phrases = [/Won't Believe/i, /Secret/i, /Top [0-99]*/i, /Guess/i]
    if phrases.none? {|phrase| phrase.match(title)}
      errors.add(:title, "not clickbaity enough!")
    end
  end


end
