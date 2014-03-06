class Assignment < ActiveRecord::Base
  belongs_to :student
  validates :score, :total, presence: true

  def percentage
    (score / total.to_f * 100).round 
  end
end
