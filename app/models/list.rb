class List < ApplicationRecord
  has_many :items, dependent: :destroy

  before_create :generate_share_id

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  def to_param
    share_id
  end

  private

  def generate_share_id
    loop do
      self.share_id = SecureRandom.alphanumeric(10)
      break unless List.exists?(share_id:)
    end
  end
end
