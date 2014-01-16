class NodesWithGrandchildren
  def initialize(node)
    @node = node
  end

  def generate
    "Nodes with Grandchildren Count: #{count_nodes(@node)}"
  end

  def count_nodes(node)
    if(node.nil?)
      # puts "found a nil"
      return 0
    elsif(node.is_a? Parser::AST::Node)
      if node.children.empty?
        return 0
      # elsif node.type == :send
        # when calling a method, don't worry about other methods on the call chain
        # just the first one
        # return 1
      elsif !has_grandchildren_nodes?(node)
        return 0
      else
        # puts "found a node with node grandchildren"
        # puts node.children.inspect
        child_counts = node.children.map { |child| count_nodes(child) }
        return 1 + child_counts.inject { |sum, count| sum + count }
      end
    else
      # puts "found a " + node.class.name
      return 0
    end
  end

  def has_grandchildren_nodes?(node)
    child_nodes = node.children.select { |c| c.is_a? Parser::AST::Node }
    grandchild_nodes = child_nodes.map { |c| c.children.select { |g| g.is_a? Parser::AST::Node }}.flatten
    return grandchild_nodes.any?
  end
end
