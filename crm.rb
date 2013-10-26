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
    puts "[4] Display all contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1
      puts "\e[H\e[2J"
      Rolodex.add_contact
      return_to_main
    when 2
      puts "\e[H\e[2J"
      Rolodex.modify_existing_contact
      return_to_main
    when 3
      puts "\e[H\e[2J"
      Rolodex.delete_contact
      return_to_main
    when 4
      puts "\e[H\e[2J"
      Rolodex.display_contacts
      return_to_main
    when 5
      puts "\e[H\e[2J"
      Rolodex.display_attributes
      return_to_main
    when 6
      puts "\e[H\e[2J"
      abort("Stay classy, San Diego")
    else
      puts "#{user_selected} is not a valid entry. You must select an option between 1 and 6."
      return_to_main
    end
  end

  def return_to_main
    puts "Hit return to continue:"
    gets
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
