class PersonPresenter
  attr_reader :first_name, :last_name, :address, :role

  def initialize(attrs)
    @name = attrs[:name].split(', ')
    @first_name = name.last
    @last_name = name.first.downcase.capitalize
    @address = Address.new(attrs[:address])
    @role = attrs[:officer_role].capitalize
  end

  private
    attr_reader :name
end
