#!/usr/bin/env ruby -w
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'subtitle_convertor'

SubtitleConvertor.new.from('IDEO_subtitles_en.txt').to('IDEO_subtitles_en.srt').convert

puts "Finish converting subtitle"

