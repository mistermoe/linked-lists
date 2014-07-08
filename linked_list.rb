class LinkedList
	attr_accessor :head, :size

	def initialize(head=nil)
		@head = head
		@size = @head ? 1 : 0
	end

	def insert_front(data)
		@head = ListNode.new(data, @head)
		@size += 1
	end

	def insert_end(data)
		last_node = @head

		while (last_node.next != nil)
			last_node = last_node.next
		end

		last_node.next = ListNode.new(data)
	end

	def length
		@size
	end	
end

class ListNode
	attr_accessor :data, :next

	def initialize(data, neighbor=nil)
		@data = data
		@next = neighbor
	end
end