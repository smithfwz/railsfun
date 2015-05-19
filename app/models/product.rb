class Product < ActiveRecord::Base
	extend Enumerize

	enumerize :difficulty_level, in: [:easy, :medium, :hard]

	belongs_to :category

	before_validation :strip_html_from_description
	before_save :change_title_to_downcase

	validates :title, :description, presence: true
	validates :price, presence: true, numericality: {greater_than: 0}
	validate :title_is_shorter_than_description

	scope :published, 					 ->{ where(published: true) }
	scope :priced_more_than,  	 ->(price){ where('price > ?', price) }
	scope :description_includes, ->(description){ where('description ILIKE ?', "%#{description}%") }

	

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:description, 'can\'t be shorter than title')
		end
	end

	def strip_html_from_description
		self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
	end

	def change_title_to_downcase
		self.title = self.title.downcase
	end
end