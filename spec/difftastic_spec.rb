require 'spec_helper'
require 'difftastic'

describe Difftastic do
  before(:each) do
    f1 = File.open('examples/file_1.rb') { |x| x.read }
    f2 = File.open('examples/file_2.rb') { |x| x.read }
    @diff = Difftastic.new
  end

  it "#write yields a pretty-printed output" do
    @diff.write.should == File.open('examples/diff') { |x| x.read }
  end


end
