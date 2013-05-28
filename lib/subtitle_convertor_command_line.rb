
require 'subtitle_convertor'

module SubtitleConvertorCommandLine
  
  def self.error message
    puts message
    usage
  end

  def self.usage
    puts "usage: convert source [destination]"
  end
  
  def self.target_file_from_source source_file
    File.basename(source_file, File.extname(source_file)) + ".srt"
  end
  
  def self.process(command_line_arguments)
    return error "convert_subtitle: missing arguments!\n" if command_line_arguments.empty?
    return error "convert_subtitle: too much arguments!\n" if command_line_arguments.size > 2

    source_file = command_line_arguments[0]
    target_file = command_line_arguments[1] || target_file_from_source(source_file)
    
    SubtitleConvertor.new.from(source_file).to(target_file).convert
    puts "Finished converting subtitle"
  end
end