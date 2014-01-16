class CallCount < NodeCount
  def generate
    "Calls/Blocks: #{call_count(@node)}"
  end

  def calling_types
    [:send, :begin, :block, :sclass, :alias, :super, :zsuper]
  end

  def call_count(node)
    count = 0
    if(calling_types.include? node.type)
      count += 1
    end

    child_nodes = node.children.select { |c| c.is_a? Parser::AST::Node }
    child_nodes.each do |c|
      count += call_count(c)
    end
    return count
  end
end
