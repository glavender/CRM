class Contact
  attr_accessor :first_name, :last_name, :email, :note, :idd

  def initialize(first_name, last_name, email, note, idd)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @idd = idd
  end
end