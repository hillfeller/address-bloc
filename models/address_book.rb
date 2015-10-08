 # #8
  require_relative 'entry.rb'
  require "csv"
 
 class AddressBook
   attr_accessor :entries

   def initialize
     @entries = []
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
        @entries.insert(index, Entry.new(name, phone_number, email))
   end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
  end 
 end