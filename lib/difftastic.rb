class Difftastic

  attr_reader :diff_hash

  def initialize()
    @diff_hash = []
  end

  def compare(file1, file2)
    original = read_input(file1)
    modified = read_input(file2)

    count1 = original.lines.count
    count2 = modified.lines.count

    original.each_line.with_index do |o_line, i|
      x = i + 1
      modified.each_line.with_index do |m_line, index|
        y = index + 1
        #puts "#{line} *#{y}*"
        if o_line == m_line
          @diff_hash << {x.to_s.to_sym => y.to_s.to_sym}
          #puts "First Condition... #{x}: #{o_line.dump} == #{y}: #{m_line.dump}"
          break
        elsif y == count2
          @diff_hash << {nil => x.to_s.to_sym}
          #puts "Second Condition... #{x}: #{o_line.dump} != #{y}: #{m_line.dump}"
        else 
          #puts "Third Condition... #{x}: #{o_line.dump} != #{y}: #{line.dump}"
        end
      end 

    end

    @diff_hash
  end

  def write
    @diff_hash
  end

  private

  def read_input(stream)
    File.exists?( stream ) ? File.open( stream ) { |c| c.read } : stream
  end

end
