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
		if @head == nil
			@head = ListNode.new(data)
		else
			last_node = @head

			while (last_node.next != nil)
				last_node = last_node.next
			end

			last_node.next = ListNode.new(data)
		end
		@size += 1
	end

	def length
		@size
	end

	def squish
		original_size = self.length
		stepper = 1

		while stepper < original_size

			if @head.data == @head.next.data
				@head = @head.next
			else
				node = @head.data
				self.insert_end(node)

				@head = @head.next
			end

			stepper += 1
			@size -= 1
		end

		node = @head.data
		self.insert_end(node)
		@head = @head.next
		@size -= 1
		    binding.pry
	end
end

class ListNode
	attr_accessor :data, :next

	def initialize(data, neighbor=nil)
		@data = data
		@next = neighbor
	end
end
