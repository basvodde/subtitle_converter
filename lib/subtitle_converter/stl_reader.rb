# encoding: utf-8

class STLReader

  attr_reader :stl_sub_title_lines

  def initialize
    @stl_sub_title_lines = []
  end

  def import_stl_content(file_name)
    content = File.read(file_name)
    parse_stl_content(content)
  end

  def parse_stl_content(content)

    @stl_sub_title_lines = content.lines.collect { |line|
      matchdata = line.match(/(\d{2}(?::[0-5]\d){3})\s+,\s+(\d{2}(?::[0-5]\d){3})\s+,\s+(.*)/)
      matchdata.nil? ? nil : matchdata[1] + "#" + matchdata[2] + "#" + matchdata[3]
    }
    @stl_sub_title_lines.compact!
  end
end
