class Job < ApplicationRecord
  has_many :resumes
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  has_many :resumes
   def self.search(search)
      where("title LIKE ?", "%#{search}%").or(where("description LIKE ?", "%#{search}%"))
   end
   
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
