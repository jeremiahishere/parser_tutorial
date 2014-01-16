class NodeCount
  def initialize(node)
    @node = node
  end

  def generate
    "Node Count: #{all_children(@node)}"
  end

  def all_children(node)
    # puts node.location.expression.inspect
    count = node.children.size
    child_nodes = node.children.select { |c| c.is_a? Parser::AST::Node }
    child_nodes.each do |c|
      count += all_children(c)
    end
    return count
  end 
end
