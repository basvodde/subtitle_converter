
require 'subtitle_converter'


describe "command line interface for the subtitle convertor" do

  it "Should give a help text when not passing any parameters" do
    SubtitleConvertorCommandLine.should_receive(:puts).with("convert_subtitle: missing arguments!\n")
    SubtitleConvertorCommandLine.should_receive(:puts).with("usage: convert source [destination]")
    SubtitleConvertorCommandLine.process([])
  end

  it "Should complain about too much parameters" do
    SubtitleConvertorCommandLine.should_receive(:puts).with("convert_subtitle: too much arguments!\n")
    SubtitleConvertorCommandLine.should_receive(:puts).with("usage: convert source [destination]")
    SubtitleConvertorCommandLine.process(["1", "2", "3"])
  end

  it "Should pass both the parameters to the convertor class and print success" do
    SubtitleConvertorCommandLine.should_receive(:puts).with("Finished converting subtitle")

    convertor = double
    SubtitleConvertor.should_receive(:new).and_return(convertor)
    convertor.should_receive(:from).with("file.txt").and_return(convertor)
    convertor.should_receive(:to).with("output.srt").and_return(convertor)
    convertor.should_receive(:convert)

    SubtitleConvertorCommandLine.process(["file.txt", "output.srt"])
  end

  it "Should be able to guess the output file based on the input file" do
    SubtitleConvertorCommandLine.should_receive(:puts).with("Finished converting subtitle")

    convertor = double.as_null_object
    SubtitleConvertor.should_receive(:new).and_return(convertor)
    convertor.should_receive(:from).and_return(convertor)
    convertor.should_receive(:to).with("file.srt").and_return(convertor)

    SubtitleConvertorCommandLine.process(["file.txt"])

  end

end
