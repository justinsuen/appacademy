class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(parent_node)
    @parent.children.delete(self) if @parent
    parent_node.children << self
    @parent = parent_node
  end

  def children
    @children
  end

  def value
    @value
  end

end
