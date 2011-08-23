require 'spec_helper'
require 'difftastic'

describe Difftastic, " private methods" do
  class Difftastic
    public :read_input
  end

  it 'let me read a string' do
    diff = Difftastic.new
    diff.read_input('random string').should == 'random string'
  end

  it 'let me read a file' do
    diff = Difftastic.new
    f = File.open('examples/file_1.rb') { |x| x.read }
    diff.read_input('examples/file_1.rb').should == f
  end
end


describe Difftastic do
  before(:each) do
    @f1 = File.open('examples/file_1.rb') { |x| x.read }
    @f2 = File.open('examples/file_2.rb') { |x| x.read }
    @diff = Difftastic.new
  end

  it '#compare tells me there is a change when there is only one line' do
    diff = Difftastic.new
    #diff.compare('this line', 'that line')
    #diff.diff_hash.should == [{6 => nil}]
  end

  it "#write yields a pretty-printed output" do
    #@diff.write.should == File.open('examples/diff') { |x| x.read }
  end
end

describe Difftastic, ' temporary tests' do
  before(:each) do
    @f1 = 'examples/file_1.rb'
    @f2 = 'examples/file_2.rb'
    @diff = Difftastic.new
    @raw = [{:"1"=>:"1"}, {nil=>:"2"}, {nil=>:"3"}, {nil=>:"4"}, {nil=>:"5"}, {:"6"=>:"4"}]
  end

  it 'my refactoring does not mess up Mason\'s output' do
    @diff.compare(@f1, @f2).should == @raw
  end

end

