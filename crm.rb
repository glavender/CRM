require "contact"
require "rolodex"

class CRM
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "\e[H\e[2J"
    puts "Welcome to #{@name}"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1
      Rolodex.add_contact
      puts "Hit return to continue:"
      gets.chomp
      main_menu
    when 2
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_contacts
    when 5
      display_attributes
    when 6
      abort("Have a great day")
    end
  end

  def modify_existing_contact
    puts "Select contact to modify:"
    Rolodex.contact_options
    contact_select = gets.chomp
    puts "Select one of the following to modify: [1] first name, [2] last name, [3] email address, [4] note, [5] id"
    attr_select = gets.chomp
    case attr_select
    when "1"
      puts "Enter new first name"
      new_first = gets.chomp
      Rolodex.contacts[contact_select.to_i - 1].first_name = new_first
    when "2"
      puts "Enter new last name"
      new_last = gets.chomp
      Rolodex.contacts[contact_select.to_i - 1].last_name = new_last
    when "3"
      puts "Enter new email address"
      new_email = gets.chomp
      Rolodex.contacts[contact_select.to_i - 1].email = new_email
    when "4"
      puts "Enter new note"
      new_note = gets.chomp
      Rolodex.contacts[contact_select.to_i - 1].note = new_note 
    when "5"
      puts "Enter new id"
      new_id = gets.chomp
      Rolodex.contacts[contact_select.to_i - 1].idd = new_id 
    end
    puts "Hit return to continue:"
    gets.chomp
    main_menu
  end

  def delete_contact
    puts "Select a contact to delete:"
    Rolodex.contact_options
    to_delete = gets.chomp
    Rolodex.contacts.delete_at(to_delete.to_i - 1)
    puts "Contact deleted"
    puts "Hit return to continue:"
    gets.chomp
    main_menu
  end

  def display_contacts
    puts "The following contacts are in your rolodex:"
    puts ""
    Rolodex.contacts.each do |x|
      puts "#{x.first_name} #{x.last_name}"
      puts x.email
      puts x.note
      puts x.idd
      puts ""
    end
    puts "Hit return to continue:"
    gets.chomp
    main_menu
  end

  def display_attributes
    puts "Select an attribute:"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email address"
    puts "[4] Note"
    att_select = gets.chomp
    Rolodex.contacts.each do |x|
    case att_select
    when "1"
      puts x.first_name
    when "2"
      puts x.last_name
    when "3"
      puts x.email
    when "4"
      puts x.note
    end
    end  
    puts "Hit return to continue:"
    gets.chomp
    main_menu
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
end

Rolodex.add_initial_contacts
my_crm = CRM.new("My CRM")
my_crm.main_menu
