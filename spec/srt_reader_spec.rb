require	'spec_helper'
require	'srt_reader'

describe SrtReader do
  context "read stl file and read it content into memory" do
    let(:srt_reader) { SrtReader.new }
    let(:data)    {
      "00:00:03:15\t,\t00:00:05:26\t,\tTonight, The Deep Dive.\r
       00:00:05:27\t,\t00:00:10:01\t,\tOne company's secret weapon for innovation"
    }

    let(:result)  { [
      "00:00:03:15#00:00:05:26#Tonight, The Deep Dive.","00:00:05:27#00:00:10:01#One company's secret weapon for innovation"
    ]}

    it "should open STL file" do
      File.stub(:open).with("file_name","r") { StringIO.new(data) }
      srt_reader.import("file_name").should eq(result)
    end

  end
end