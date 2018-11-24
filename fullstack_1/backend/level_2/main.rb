require 'json'
require './progress.rb'

class Main
  def initialize(input_file)
    data = JSON.parse(File.read(input_file))
    @objectives = data['objectives']
    @progress_records = data['progress_records']
  end

  def output_to_file(path)
    output_data = {
      progress_records:@progress_records.map do |progress_record|
          index =  progress_record['objective_id']
          progress = Progress.new(@objectives[index-1],progress_record['value'],progress_record['date'])
        {
          id: progress_record['id'],
          excess:progress.excess
        }
      end
    }
    File.open(path, 'w') do |file|
      file.write(JSON.pretty_generate(output_data))
    end
  end
end
Main.new('data/input.json').output_to_file('data/output.json')
