require './log_parser.rb'
require 'spec_helper'

RSpec.describe LogParser do
  let(:file_path) { './spec/test_logs.log'}
  let(:subject) { described_class.new(file_path) }
  let(:test_paths) do {
    "/help_page/1"=>{:visits=>3, :ips=>["126.318.035.038", "929.398.951.889"]},
    "/contact"=>{:visits=>1, :ips=>["184.123.665.067"]},
    "/home"=>{:visits=>1, :ips=>["184.123.665.067"]},
    "/about"=>{:visits=>2, :ips=>["715.156.286.412", "061.945.150.735"]}
  }
  end
  before do
    subject.parse
  end

  describe '#parse' do
    it 'should return hash with number of visits and array of ips' do
      expect(subject.paths).to eq(test_paths)
    end
    
  end

  describe '#paths_sorted_by_visits' do
    it 'should reutrn list of webpages sorted by views' do
      expect(subject.paths_sorted_by_visits).to eq(["/help_page/1 3 visits", "/about 2 visits", 
                                                    "/home 1 visits", "/contact 1 visits"])
    end
  end

  describe '#paths_sorted_by_unique_visits' do
    it 'should return list of unique page views sorted by views' do
      expect(subject.paths_sorted_by_unique_visits).to eq(["/about 2 unique visits", 
                                                          "/help_page/1 2 unique visits",
                                                          "/home 1 unique visits",
                                                          "/contact 1 unique visits"])
    end
  end
end 