class SrtReader
  attr_reader :srt_sub_title_lines
  def initialize
    @srt_sub_title_lines = []
  end

  def import_srt_content(file_name)
    file =File.open(file_name, "r")
    parse_srt_content(file)
  end

  def parse_srt_content(file)
    file.each do |line|
      if line =~ /\d{2}(:[0-5]\d){3}\t,\t\d{2}(:[0-5]\d){3}\t,\t.*/
        sub_title_line_token = line.split("\t,\t")
        @srt_sub_title_lines.push(sub_title_line_token[0].strip+"#"+sub_title_line_token[1].strip+"#"+sub_title_line_token[2].strip)
      end
    end
  end
end