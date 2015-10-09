require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def demolish_entries
    puts "This will delete all entries in the address book. Please select 'y' in order to proceed with deletion. Please select m if you would rather return to main menu."
    confirmation = gets.chomp
    if confirmation == 'y'
      @entries = []
      puts "All entries have been deleted"
    elsif confirmation == 'm'
      system "clear"
    else
      puts "Please choose either 'y' to proceed with deletion of all entries, or 'm' to return to main menu."
    end
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|

      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    @entries.each do |entry|
      if  name == entry.name && phone_number == entry.phone_number && email == entry.email
        @entries.delete(entry)
      end
    end
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
  end 

  def binary_search(name)
    lower = 0
    upper = entries.length - 1

 # #2
    while lower <= upper
 # #3
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
 
 # #4
      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end
    return nil
  end

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
 # #4
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
 # #5
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
 # #6
    puts "Updated entry:"
    puts entry
  end
end
