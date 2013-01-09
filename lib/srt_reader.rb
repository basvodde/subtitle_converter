class SrtReader
  attr_reader :srt_sub_title_lines
  def initialize
    @srt_sub_title_lines = []
  end

  def import_srt_content(file_name)
    begin
      file =File.open(file_name, "r")
      parse_srt_content(file)
    rescue SystemCallError
      puts "File not found"
    end
  end

  private
  def parse_srt_content(file)
    @srt_sub_title_lines = file.select{|line|
      line =~ /\d{2}(:[0-5]\d){3}\t,\t\d{2}(:[0-5]\d){3}\t,\t.*/
    }.map{|line|
      line.split("\t,\t").map(&:strip).join("#")
    }
  end
end