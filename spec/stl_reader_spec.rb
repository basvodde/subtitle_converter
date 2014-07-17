
require 'subtitle_converter'

describe STLReader do

  describe "read stl file and read it content into memory" do

    let(:stl_reader) { STLReader.new }

    let(:data)    {
      "00:00:03:15\t,\t00:00:05:26\t,\tTonight, The Deep Dive.
       00:00:05:27\t,\t00:00:10:01\t,\tOne company's secret weapon for innovation"
    }

    let(:result)  { [
      "00:00:03:15#00:00:05:26#Tonight, The Deep Dive.","00:00:05:27#00:00:10:01#One company's secret weapon for innovation"
    ]}

    it "should open STL file and import content to 'srt_sub_title_lines'" do
      File.stub(:read).with("file_name") { data }
      stl_reader.import_stl_content("file_name")
      stl_reader.stl_sub_title_lines.should eq(result)
    end
  end
end
