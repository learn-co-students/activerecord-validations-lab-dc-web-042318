class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
	validates :summary, length: {maximum: 50}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	validate :clickbait

	def clickbait
		clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
		inclusion = false

		clickbaits.each do |word|
			if !self.title.nil? && self.title.include?(word)
				inclusion = true
			end
		end
		if !inclusion
			errors.add(:title, "doesn't contain a clickbait word")
		end
		inclusion
	end
end
