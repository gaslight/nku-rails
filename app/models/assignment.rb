class Assignment < ActiveRecord::Base
  belongs_to :student
  validates :score, :total, presence: true

  def percentage
    (score / total.to_f * 100).round
  end

  def self.average_percentage
    sum_score = sum('score')
    sum_total = sum('total')
    return 0 if sum_total == 0
    (sum_score / sum_total.to_f * 100).round
  end
end
