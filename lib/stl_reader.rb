class STLReader
  attr_reader :stl_sub_title_lines
  def initialize
    @stl_sub_title_lines = []
  end

  def import_stl_content(file_name)
    begin
      file =File.open(file_name, "r")
      parse_srt_content(file)
      file.close
    rescue SystemCallError
      puts "File not found"
    end
  end

  private
  def parse_srt_content(file)
    @stl_sub_title_lines = file.select{|line|
      line =~ /\d{2}(:[0-5]\d){3}\t,\t\d{2}(:[0-5]\d){3}\t,\t.*/
    }.map{|line|
      line.split("\t,\t").map(&:strip).join("#")
    }
  end
end