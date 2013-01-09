class SubRibWriter
  attr_reader :subrib_sub_title_lines

  def initialize
    @subrib_sub_title_lines = []
  end

  def parse_stl_lines(stl_sub_title_lines)
    line_number = 1
    stl_sub_title_lines.each do |line|
      @subrib_sub_title_tokens = line.split("#")
      @subrib_sub_title_lines.push(line_number.to_s+"\r"+
                                   @subrib_sub_title_tokens[0].sub(/(...)$/){|s| ","+((33*s[1,2].to_i).to_s).rjust(3, "0") }+
                                   "\t-->\t"+
                                   @subrib_sub_title_tokens[1].sub(/(...)$/){|s| ","+((33*s[1,2].to_i).to_s).rjust(3, "0") }+
                                   "\r"+
                                   @subrib_sub_title_tokens[2]+"\r"
      )
      line_number = line_number+1
    end
  end
end