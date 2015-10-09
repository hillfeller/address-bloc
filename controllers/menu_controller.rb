require_relative '../models/address_book'
 
class MenuController
  attr_accessor :address_book
 
  def initialize
     @address_book = AddressBook.new
  end
 
  def main_menu
 # #2
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Delete all entries"
    puts "7 - Exit"
    print "Enter your selection: "
 
 # #3
    selection = gets.to_i
    puts "You picked #{selection}"
  end
  case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      entry_number
      main_menu
    when 6
      system "clear"
      @address_book.demolish_entries
      main_menu
    when 7
      puts "Good-bye!"
 # #8
      exit(0)
 # #9
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end
 
 # #10
   
  def create_entry
 # #11
    system "clear"
    puts "New AddressBloc Entry"
 # #12
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
 
 # #13
    @address_book.add_entry(name, phone, email)
 
    system "clear"
    puts "New entry created"
  end   

  def view_all_entries
 # #14
    @address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s
 # #15
    entry_submenu(entry)
  end
 
    system "clear"
    puts "End of entries"

  def entry_submenu(entry)
 # #16
    puts "\nn - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
 
 # #17
    selection = $stdin.gets.chomp
 
  case selection
 # #18
    when "n"
 # #19
    when "d"

      delete_entry(entry)  
    when "e"
      edit_entry(entry)
      entry_submenu(entry)
 # #20
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entries_submenu(entry)
    end
  end

  def entry_number(number)
    puts "Please enter the entry number: "
    number = gets.chomp.to_i
      while number != Numeric || number < 0 || number > @address_book.entries.count
        puts "That is not a valid entry. Please enter a number "
      end
    puts "You have selected entry #{number}"
    system "clear"
    end

  def read_csv
 # #1
    print "Enter CSV file to import: "
    file_name = gets.chomp
 
 # #2
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end
 
 # #3
    begin
      entry_count = @address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
  end

  def search_entries
 # #9
    print "Search by name: "
    name = gets.chomp
 # #10
    match = @address_book.binary_search(name)
    system "clear"
 # #11
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
 # #12
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
 # #13
    selection = gets.chomp
 
 # #14
  case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system "clear"
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end

  
end