require 'csv'

class AssignmentImporter
  def self.import(file)
    new(file).import
  end

  def initialize(file)
    @file = file
  end

  def import
    Response.new do
      csv = CSV.new(@file.read, :headers => true, :header_converters => :symbol, :converters => [:all])
      attribute_sets = csv.to_a.map {|row| row.to_hash }
      attribute_sets.each { |attributes| create_record(attributes) }
    end
  end

  def create_record(attributes)
    student = Student.find_or_create_from_email(attributes[:email])
    assignment = Assignment.find_or_initialize_by(
      student_id: student.id,
      name: attributes[:assignment_name])
    assignment.total = attributes[:total]
    assignment.score = attributes[:score]
    assignment.save!
  end

  class Response
    def initialize(&block)
      @before_count = Assignment.count
      yield
      @after_count = Assignment.count
    end

    def created_count
      @after_count - @before_count
    end
  end
end
