class SrtReader
  attr_reader :srt_sub_title_lines
  def initialize
    @srt_sub_title_lines = Array.new
  end

  def import(file_name)
    file =File.open(file_name, "r")
    file.each do |line|
      if line =~ /[0-9][0-9]:[0-5][0-9]:[0-5][0-9]:[0-5][0-9]\t,\t[0-9][0-9]:[0-5][0-9]:[0-5][0-9]:[0-5][0-9]\t,\t.*/
        sub_title_line_token = line.split("\t,\t")
        @srt_sub_title_lines.push(sub_title_line_token[0].strip+"#"+sub_title_line_token[1].strip+"#"+sub_title_line_token[2].strip)
      end
    end
    srt_sub_title_lines
  end
end