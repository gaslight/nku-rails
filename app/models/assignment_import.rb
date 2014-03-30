require 'csv'

class AssignmentImport
  attr_reader :created_count

  def initialize(file)
    @file = file
    @created_count = 0
  end

  def run
    csv = CSV.new(@file.read, :headers => true, :header_converters => :symbol, :converters => [:all])
    attribute_sets = csv.to_a.map {|row| row.to_hash }
    attribute_sets.each { |attributes| create_record(attributes) }
  end

  private

  def create_record(attributes)
    student = Student.find_or_create_from_email(attributes[:email])
    assignment = Assignment.find_or_initialize_by(
      student_id: student.id,
      name: attributes[:assignment_name])
    assignment.total = attributes[:total]
    assignment.score = attributes[:score]
    count_record(assignment)
    assignment.save!
  end

  def count_record(record)
    @created_count += 1 if record.new_record?
  end
end
