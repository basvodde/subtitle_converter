
require 'stl_reader'
require 'sub_rib_writer'

class SubtitleConvertor
  
  def from(filename)
    @reader = STLReader.new
    @reader.import_stl_content(filename)
    self
  end
  
  def to(filename)
    @writer = SubRibWriter.new
    @output_file = filename
    self
  end
  
  def convert
    @writer.parse_stl_lines(@reader.stl_sub_title_lines)
    @writer.to_file(@output_file)
  end
  
end