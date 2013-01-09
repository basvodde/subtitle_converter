class SubRibWriter
  attr_reader :subrib_sub_title_lines

  def initialize
    @subrib_sub_title_lines = []
  end

  def parse_stl_lines(stl_sub_title_lines)
    subtitle_number = 1
    stl_sub_title_lines.each do |line|
      start_time, end_time, text_of_subtitle = line.split("#")
      @subrib_sub_title_lines.push("#{subtitle_number}\r#{re_format(start_time)}\t-->\t#{re_format(end_time)}\r#{text_of_subtitle}\r")
      subtitle_number = subtitle_number+1
    end
  end

  def re_format(hh_mm_ss_fps)
    hh_mm_ss_fps.sub(/(...)$/){|fps| ","+convert_fps_to_millisec(fps)}
  end

  def convert_fps_to_millisec(frames_per_sec)
    ((33*frames_per_sec[1,2].to_i).to_s).rjust(3, "0")
  end
end