#!/Users/roofimon/.rvm/rubies/ruby-1.9.3-p327/bin/ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'stl_reader'
require 'sub_rib_writer'

stl_reader = STLReader.new
stl_reader.import_stl_content('IDEO_subtitles_en.txt')

subrib_writer = SubRibWriter.new
subrib_writer.parse_stl_lines(stl_reader.stl_sub_title_lines)
subrib_writer.to_file('IDEO_subtitles_en.srt')

puts "Finish converting subtitle"

