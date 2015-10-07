 # #8
  require_relative 'entry'
 
 class AddressBook
   attr_accessor :entries

   def initialize
     @entries = []
   end
   
   def add_entry(name, phone_number, email)
 # #9
     index = 0
     @entries.each do |entry|
 # #10
       if name < entry.name
         break
       end
       index += 1
     end

  def remove_entry(name, phone_number, email)

    removed = 0
    @entries.each do |entry|
      if name == entry.name && phone == entry.phone_number && email == entry.email
        removed = entry
      end
      @entries.delete(removed)
  end
 # #11
     @entries.insert(index, Entry.new(name, phone_number, email))
   end
 end