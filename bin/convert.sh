#!/usr/bin/env ruby -w
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'subtitle_convertor'

# stl_reader = STLReader.new
# stl_reader.import_stl_content('IDEO_subtitles_en.txt')
# 
# subrib_writer = SubRibWriter.new
# subrib_writer.parse_stl_lines(stl_reader.stl_sub_title_lines)
# subrib_writer.to_file('IDEO_subtitles_en.srt')

SubtitleConvertor.new.from('IDEO_subtitles_en.txt').to('IDEO_subtitles_en.srt').convert

puts "Finish converting subtitle"

