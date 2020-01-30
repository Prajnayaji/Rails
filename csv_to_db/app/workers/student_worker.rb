class StudentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, :queue => "data_import_worker"

  require 'csv'

  def perform(csv_path)
    puts "hiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    puts csv_path
    CSV.parse(csv_path.read, headers: true) do |row|
      Student.create(
        roll_no: row[0],
        name: row[1],
        address: row[2],
        marks: row[3]
      )
  end

  flash[:notice] = "All values are added to db."
  render 'trial'
    # Do something
  end
end
