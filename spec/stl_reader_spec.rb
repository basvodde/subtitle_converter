require	'spec_helper'
require	'stl_reader'

describe STLReader do
  describe "read stl file and read it content into memory" do
    let(:stl_reader) { STLReader.new }
    let(:data)    {
      "00:00:03:15\t,\t00:00:05:26\t,\tTonight, The Deep Dive.\r
       00:00:05:27\t,\t00:00:10:01\t,\tOne company's secret weapon for innovation"
    }

    let(:result)  { [
      "00:00:03:15#00:00:05:26#Tonight, The Deep Dive.","00:00:05:27#00:00:10:01#One company's secret weapon for innovation"
    ]}

    it "should open STL file and import content to 'srt_sub_title_lines'" do
      File.stub(:open).with("file_name","r") { StringIO.new(data) }
      stl_reader.import_stl_content("file_name")
      stl_reader.stl_sub_title_lines.should eq(result)
    end

    it "should inform 'file not found' in case target file doesn't exist" do
      stl_reader.should_receive(:puts).with("File not found")
      stl_reader.import_stl_content("not_existing_file")
    end
  end
end