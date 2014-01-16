class AssignmentCount < NodeCount
  def generate
    "Assignments: #{assignment_count(@node)}"
  end

  def assignment_types
    [:lvasgn, :ivasgn, :cvasgn, :gvasgn, :casgn, :'op-asgn', :'or-asgn', :'and-asgn']
  end

  def assignment_count(node)
    count = 0

    if(assignment_types.include? node.type)
      count += 1
    end

    child_nodes = node.children.select { |c| c.is_a? Parser::AST::Node }
    child_nodes.each do |c|
      count += assignment_count(c)
    end
    return count
  end
end
