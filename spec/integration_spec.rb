
require 'subtitle_converter'
require 'tmpdir'

describe "Trying out different files and output to see if the integration works" do

  before (:each) {
    @tempdir = Dir.mktmpdir
  }

  after (:each) {
    FileUtils.remove_entry_secure @tempdir
  }

  def asset_file(filename)
    File.join(File.dirname(__FILE__), "assets", filename)
  end

  def output_file(filename)
    File.join(@tempdir, filename)
  end


  subject { SubtitleConvertor.new }

  it "Can convert the IDEO shopping cart video subtitles from STL to SRT" do
    subject.from_file(asset_file("IDEO_subtitles_en.txt")).to_file(output_file("IDEO_subtitles_en.srt")).convert
    File.read(output_file("IDEO_subtitles_en.srt")).should== File.read(asset_file("IDEO_subtitles_en.srt"))
  end

  it "Can convert the Shit ScrumMasters say in English" do
    subject.from_file(asset_file("bad scrummaster_subtitles_en.txt")).to_file(output_file("bad scrummaster_subtitles_en.srt")).convert
    File.read(output_file("bad scrummaster_subtitles_en.srt")).should== File.read(asset_file("bad scrummaster_subtitles_en.srt"))
  end

  it "Can convert the Shit ScrumMasters say in Chinese" do
    subject.from_file(asset_file("bad scrummaster_subtitles_cn.txt")).to_file(output_file("bad scrummaster_subtitles_cn.srt")).convert
    File.read(output_file("bad scrummaster_subtitles_cn.srt")).should== File.read(asset_file("bad scrummaster_subtitles_cn.srt"))
  end

end
