require 'spec_helper'
require 'diff'

describe Difftastic, "something" do
  before(:each) do
    f = "def kick_ass
      ass-= 1
    end
    def your_mom
      ugly += 500
    end"
    f2 = "def kick_ass
      ass -= 2
      alert 'ouch'
    end"

    @diff = Difftastic.new
    @diff.file1 = f
    @diff.file2 = f2
  end
end
