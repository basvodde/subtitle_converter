
require 'subtitle_converter'

describe "the subtitle convertor" do

  before (:each) {
    @reader = double.as_null_object
    @writer = double.as_null_object
  }

  subject { SubtitleConvertor.new }

  it "Should create a reader when calling from" do
    STLReader.should_receive(:new).and_return(@reader)
    @reader.should_receive(:import_stl_content).with("subtitle_stl_file")

    subject.from_file("subtitle_stl_file")
  end

  it "Should create a writer when calling to" do
    SubRibWriter.should_receive(:new).and_return(nil)

    subject.to_file("subtitle_srt_file")
  end

  it "Should convert from one to another on convert" do
    STLReader.should_receive(:new).and_return(@reader)
    SubRibWriter.should_receive(:new).and_return(@writer)

    @reader.should_receive(:stl_sub_title_lines).and_return("subtitles")
    @writer.should_receive(:parse_stl_lines).with("subtitles")
    @writer.should_receive(:to_file).with("srt_file")

    subject.from_file("stl_file")
    subject.to_file("srt_file")
    subject.convert
  end

  it "Follows a builder structure" do
    STLReader.should_receive(:new).and_return(@reader)
    SubRibWriter.should_receive(:new).and_return(@writer)

    subject.from_file("stl_file").to_file("srt_file").convert
  end

  it "Can convert content without writing to files" do
    subject.from("00:01:08:16	,	00:01:09:16	,	Yeah, no problem").convert_to_s.should== "1\n00:01:08,528 --> 00:01:09,528\nYeah, no problem\n\n"
  end
end
