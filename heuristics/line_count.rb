class LineCount
  def initialize(node)
    @node = node
  end

  def generate
    "Line Count: #{lines(@node)}"
  end

  def lines(node)
    lines = node.loc.expression.source.lines.to_a[1..-2] || []                                                                           
    lines.reject! { |line| irrelevant_line(line) }    
    lines.size
  end

  def irrelevant_line(line)
    line.empty? || comment_line?(line)
  end

  def comment_line?(line)
    line =~ /^\s*#/  
  end
end
