class AddStudentJob < ApplicationJob
  queue_as :default
  require 'csv'
  def perform(csv_data)
    # Do something later
    puts "hiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts csv_data
    CSV.parse(csv_data, headers: true) do |row|
      Student.create(
        roll_no: row[0],
        name: row[1],
        address: row[2],
        marks: row[3]
      )
  end
end
end
