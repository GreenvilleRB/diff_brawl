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

    # Cycle through the original file, line by line.  At each line,
    # cycle through the modified file, line by line.  At each line of
    # the second file, ask two questions.  'Is the current line of the
    # first file identical to the current line of the second?' If so,
    # push a hash with those line numbers onto @diff_hash and move on to
    # the next line of the original file.  If not, ask the second
    # question: 'Is the current line number (in the second file) equal
    # to the length of the current file?'  If so, we know this line
    # isn't matched, put a nil in its place in our array of hashes and
    # put, as its value in the hash, the line number of the original
    # file.
    original.each_line.with_index do |o_line, i|
      x = i + 1
      modified.each_line.with_index do |m_line, index|
        y = index + 1
        if o_line == m_line
          @diff_hash << {x => y}
          break
        elsif y == count2
          @diff_hash << {nil => x}
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
