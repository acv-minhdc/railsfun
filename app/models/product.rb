class Product < ApplicationRecord
  validates :title, :description, presence: true
  validate :title_is_shorter_than_description
  validates :price, presence: true, numericality: { greater_than: 0 }

  def title_is_shorter_than_description
    return if title.blank? || description.blank?
    # if description.length < title.length
    #   errors.add(:description, 'can\'t be shorter than title')
    # end
    return if description.length >= title.length
    errors.add(:description, 'can\'t be shorter than title')
  end

end
