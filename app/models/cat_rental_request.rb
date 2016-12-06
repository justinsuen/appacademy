# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: "Invalid status" }
  validate :overlapping_approved_requests
  validate :valid_dates?

  belongs_to :cat

  def valid_dates?
    if start_date >= end_date
      errors[:id] << "No time travel"
    end
  end

  def overlapping_requests?(other_req)
    (self.start_date - other_req.end_date) * (other_req.start_date - self.end_date) >= 0
  end

  def overlapping_approved_requests
    approved_req = CatRentalRequest.all.where(status: "APPROVED")
    approved_req.each do |request|
      if self.overlapping_requests?(request)
        errors[:id] << "Requests cannot overlap"
      end
    end
  end
end
