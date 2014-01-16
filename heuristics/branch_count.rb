class BranchCount < NodeCount
  def generate
    "Branches (not exact): #{branch_count(@node)}"
  end

  # does not include case statements for now
  # would require a different solution and I am lazy
  def branching_types
    [:if, :while, :until, :'while-post', :'until-post']
  end

  def branch_count(node)
    count = 0

    if(branching_types.include? node.type)
      # this should recurse to find && and || in the condition
      count += 1
    end

    child_nodes = node.children.select { |c| c.is_a? Parser::AST::Node }
    child_nodes.each do |c|
      count += branch_count(c)
    end
    return count
  end
end
