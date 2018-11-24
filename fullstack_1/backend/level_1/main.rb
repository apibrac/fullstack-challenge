require 'json'

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
          num = progress_record['value'] - @objectives[index-1]['start']
          den = @objectives[index-1]['target'] - @objectives[index-1]['start']
          res = (num*100.0/(den.nonzero?||1)).round
        {
          id: progress_record['id'],
          progress: res
        }
      end
    }
    File.open(path, 'w') do |file|
      file.write(JSON.pretty_generate(output_data))
    end
  end
end
Main.new('data/input.json').output_to_file('data/output.json')
