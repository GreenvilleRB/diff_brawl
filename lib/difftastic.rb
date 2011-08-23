class Difftastic

  attr_reader :diff_hash

  def initialize()
    @diff_hash = []
  end

  def compare(file1, file2)
    count1 = File.foreach(file1).inject(0) {|c, line| c+1}
    count2 = File.foreach(file2).inject(0) {|c, line| c+1}
    x = 1
   
    IO.foreach(file1) do |line| 
      temp1 = line
      y = 1
      IO.foreach(file2) do |line| 
        #puts "#{line} *#{y}*"
        temp2 = line
        if temp1 == temp2
          @diff_hash << {x.to_s.to_sym => y.to_s.to_sym}
          #puts "First Condition... #{x}: #{temp1.dump} == #{y}: #{temp2.dump}"
          break
        elsif y == count2
          @diff_hash << {nil => x.to_s.to_sym}
          #puts "Second Condition... #{x}: #{temp1.dump} != #{y}: #{temp2.dump}"
        else 
          #puts "Third Condition... #{x}: #{temp1.dump} != #{y}: #{temp2.dump}"
          y+=1
        end
      end 
      x += 1

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
