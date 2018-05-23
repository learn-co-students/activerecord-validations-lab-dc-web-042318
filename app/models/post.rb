class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    top = (0..9).map { |n| "top #{n}" }
    click_bait = ["won't believe", "secret", "guess", "true facts"]
    if self.title.nil? || click_bait.include?(self.title.downcase) || top.include?(self.title.downcase)
      errors.add(:title, 'not clickbait')
    end
  end
end
