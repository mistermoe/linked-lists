require 'spec_helper'

describe LinkedList do
	it 'exists' do
	  expect(described_class).to be_a(Class)
	end

	it 'creates an empty linked list' do
	  linked_list = LinkedList.new
	  expect(linked_list.head).to eq(nil)
	  expect(linked_list.size).to eq(0)
	end

	it 'adds a node to the front of the list' do
	  linked_list = LinkedList.new
	  linked_list.insert_front(2)

	  expect(linked_list.head).to be_a(ListNode)
	  expect(linked_list.head.data).to eq(2)
	  expect(linked_list.head.next).to eq(nil)
	  expect(linked_list.size).to eq(1)

	  linked_list.insert_front(3)

	  expect(linked_list.head.data).to eq(3)
	  expect(linked_list.size).to eq(2)
	end
	it 'returns the length of the linked list' do
	  linked_list = LinkedList.new
	  linked_list.insert_front(2)
	  linked_list.insert_front(1)
	  linked_list.insert_front(1)
	  linked_list.insert_front(3)
	  linked_list.insert_front(5)

	  expect(linked_list.length).to eq(5)
	end

	it 'adds a node to the end of the list' do
		linked_list = LinkedList.new
	  linked_list.insert_front(2)
	  linked_list.insert_front(1)
	  linked_list.insert_front(1)
	  linked_list.insert_front(3)
	  linked_list.insert_front(5)

	  linked_list.insert_end(8)
		expect(linked_list.length).to eq(6)

	 	last_node = linked_list.head

	 	while (last_node.next != nil)
	 		last_node = last_node.next
	 	end

	 	expect(last_node.data).to eq(8)

	end

	it 'squishes the linked list so as to get rid of consecutive duplicate runs' do
	  linked_list = LinkedList.new

	  linked_list.insert_end(0)
	  linked_list.insert_end(0)
	  linked_list.insert_end(0)
	  linked_list.insert_end(0)
	  linked_list.insert_end(1)
	  linked_list.insert_end(1)
	  linked_list.insert_end(0)
	  linked_list.insert_end(0)
	  linked_list.insert_end(0)
	  linked_list.insert_end(3)
	  linked_list.insert_end(3)
	  linked_list.insert_end(3)
	  linked_list.insert_end(1)
	  linked_list.insert_end(1)
	  linked_list.insert_end(0)

	  linked_list.squish

	  linked_list_data = []
	  node = linked_list.head

	  while (node.next != nil)
	  	linked_list_data << node.data
	  	node = node.next
	  end

	  squished = [0,1,0,3,1,0]
	  for i in (0...squished.length)
	  	expect(linked_list_data[i]).to eq(squished[i])
	  end
	end
end
