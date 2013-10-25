class Rolodex
  attr_accessor :iddd
  @contacts = []
  @iddd = 1002

  def self.add_contact
  puts "Enter first name:"
    first_name = gets.chomp
    puts "Enter last name:"
    last_name = gets.chomp
    puts "Enter email address:"
    email = gets.chomp
    puts "Enter note:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note, @iddd)
    @contacts << contact
    @iddd += 1
  end
  def self.add_initial_contacts
    @contacts << contact1 = Contact.new("Graham", "Lavender", "glavender@gmail.com", "Aspiring web developer", 1000)
    @contacts << contact2 = Contact.new("John", "Smith", "j.smithe@boringcompany.com", "Works boring office job", 1001)
  end
  def self.contact_options
    y = 1
    Rolodex.contacts.each do |x|
      puts "[#{y}] #{x.first_name} #{x.last_name}"
      y += 1
    end
  end

  def self.contacts
    @contacts
  end
end