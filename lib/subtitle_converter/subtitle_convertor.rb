# encoding: utf-8

class SubtitleConvertor

  def initialize
    @reader = STLReader.new
    @writer = SubRibWriter.new
  end

  def from(content)
    @reader.parse_stl_content(content)
    self
  end

  def from_file(filename)
    @reader.import_stl_content(filename)
    self
  end

  def to_file(filename)
    @output_file = filename
    self
  end

  def convert_to_s
    @writer.parse_stl_lines(@reader.stl_sub_title_lines)
    @writer.subrib_sub_title_lines.join
  end

  def convert
    @writer.parse_stl_lines(@reader.stl_sub_title_lines)
    @writer.to_file(@output_file)
  end

end
