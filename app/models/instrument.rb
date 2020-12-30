class Instrument < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON 
  belongs_to :user, optional: true
  has_many :line_items

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000}
  validates :title, length: { maximum: 140}
  validates :price, length: { maximum: 7}
  
  BRAND = %w{Fender Gibson Epiphone ESP MArtin Dean Taylor}
  FINISH = %w{Black White Navy Blue REd Clear Satin Yellow Seafoam}
  CONDITION = %w{New Excellent Mint Used Fair Poor}

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

  def self.search_by(search_term)
    where("Lower(title) LIKE :search_term",
     search_term: "%#{search_term.downcase}%")
  end
end
