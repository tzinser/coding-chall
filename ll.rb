#coding challenge - linked list 

class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
	  @value = value
	  @next_node = next_node
	end
end

class ListNodePrinter
  def output(list_node)  
    print "#{list_node.value} --> "
    if list_node.next_node.nil?
      print "nil\n"
      return
    else
      output(list_node.next_node)
    end
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

list_node_printer = ListNodePrinter.new
list_node_printer.output(node3)


#class level method self.output