require	'spec_helper'
require 'sub_rib_writer'

describe SubRibWriter do
  let(:subrib_writer) { SubRibWriter.new }
  let(:stl_sub_title_lines)  { [
      "00:00:03:15#00:00:05:26#Tonight, The Deep Dive.","00:00:05:27#00:00:10:01#One company's secret weapon for innovation"
  ]}

  let(:result)  { [
      "1\r00:00:03,495 --> 00:00:05,858\rTonight, The Deep Dive.\r",
      "2\r00:00:05,891 --> 00:00:10,033\rOne company's secret weapon for innovation\r"
  ]}

  let(:expect_file_content)  {
      "1\r00:00:03,495 --> 00:00:05,858\rTonight, The Deep Dive.\r"+
      "2\r00:00:05,891 --> 00:00:10,033\rOne company's secret weapon for innovation\r"
  }
  describe "convert_fps_to_millisecond" do
    it "should convert fps to millisec" do
      subrib_writer.convert_fps_to_millisec("15").should eq("495")
    end
    context "when result has 2 digits" do
      it "should prepend 0" do
        subrib_writer.convert_fps_to_millisec("1").should eq("033")
      end
    end
  end

  describe "re_format(hh_mm_ss_fps)" do
    it "should be able to convert hh:mm:ss:fps to hh:mm:ss,millisecond" do
      subrib_writer.re_format("00:00:03:15").should eq("00:00:03,495")
      #subrib_writer.re_format("00:00:05:26").should eq("00:00:05,858")
    end
  end

  describe "convert_fps_to_millisec(frames_per_sec)" do
    it "should parse stl lines into 'subrib_sub_title_line'" do
      subrib_writer.parse_stl_lines(stl_sub_title_lines)
      subrib_writer.subrib_sub_title_lines.should eq(result)
    end
  end

  describe "write_to_file" do
    it "should create file 'subrib_subtitle.srt' all data in subrib_sub_title_lines in" do
      file = mock("filename")
      File.should_receive(:open).with("filename", "w").and_yield(file)
      file.should_receive(:puts).at_least(:twice)

      subrib_writer.parse_stl_lines(stl_sub_title_lines)
      subrib_writer.to_file("filename")
    end
  end

end
