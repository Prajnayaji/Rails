class StudentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require 'csv'

  def perform(csv_path)
    puts "hiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts csv_path
    CSV.parse(csv_path, headers: true) do |row|
      Student.create(
        roll_no: row[0],
        name: row[1],
        address: row[2],
        marks: row[3]
      )
  end
    # Do something
  end
end
