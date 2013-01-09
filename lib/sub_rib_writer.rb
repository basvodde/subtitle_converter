class SubRibWriter
  attr_reader :subrib_sub_title_lines

  def initialize
    @subrib_sub_title_lines = []
  end

  def parse_stl_lines(stl_sub_title_lines)
    subtitle_number = 1
    stl_sub_title_lines.each do |line|
      start_time, end_time, text_of_subtitle = line.split("#")
      @subrib_sub_title_lines.push("#{subtitle_number}\r#{format(start_time)}\t-->\t#{format(end_time)}\r#{text_of_subtitle}\r")
      subtitle_number = subtitle_number+1
    end
  end

  def format(original_format)
    original_format.sub(/(...)$/){|s| ","+((33*s[1,2].to_i).to_s).rjust(3, "0") }
  end
end