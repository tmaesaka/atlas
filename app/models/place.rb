class Place < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :city, optional: true

  has_many :place_details

  before_create :set_alternate_id

  private

  def set_alternate_id
    loop do
      self.alternate_id = SecureRandom.hex[0..11]
      break unless self.class.exists? alternate_id: alternate_id
    end
  end
end
