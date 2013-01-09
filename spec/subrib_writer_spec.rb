require	'spec_helper'
require 'sub_rib_writer'

describe SubRibWriter do
  let(:subrib_writer) { SubRibWriter.new }
  let(:stl_sub_title_lines)  { [
      "00:00:03:15#00:00:05:26#Tonight, The Deep Dive.","00:00:05:27#00:00:10:01#One company's secret weapon for innovation"
  ]}

  let(:result)  { [
      "1\r00:00:03,495\t-->\t00:00:05,858\rTonight, The Deep Dive.\r",
      "2\r00:00:05,891\t-->\t00:00:10,033\rOne company's secret weapon for innovation\r"
  ]}

  it "should be able to convert fps(frames per sec) to millisecond" do
    subrib_writer.convert_fps_to_millisec("15").should eq("495")
    subrib_writer.convert_fps_to_millisec("1").should eq("033")
  end

  it "should be able to convert hh:mm:ss:fps to hh:mm:ss,millisecond" do
    subrib_writer.re_format("00:00:03:15").should eq("00:00:03,495")
    subrib_writer.re_format("00:00:05:26").should eq("00:00:05,858")
  end

  it "should parse stl lines into 'subrib_sub_title_line'" do
    subrib_writer.parse_stl_lines(stl_sub_title_lines)
    subrib_writer.subrib_sub_title_lines.should eq(result)
  end
end
