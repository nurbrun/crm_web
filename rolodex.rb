class Rolodex
	attr_reader :contacts

	def initialize
		@contacts = []
		@id_index = 1000
	end

	def add_contact (contact)
		contact.id = @id_index
		@contacts << contact
		@id_index += 1
	end

	def find(contact_id)
		@contacts.find {|contact| contact.id == contact_id}
	end
end
