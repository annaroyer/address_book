class PersonPresenter
  attr_reader :first_name, :last_name, :address

  def initialize(attrs)
    @name = attrs[:name].split(', ')
    @first_name = name.first
    @last_name = name.last.downcase.capitalize
    @address = Address.new(attrs[:address])
  end

  private
    attr_reader :name
end
