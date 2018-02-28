class Store
  attr_reader :long_name, :distance, :phone, :city, :type

  def initialize(attrs = {})
    @long_name = attrs[:longName]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @type = attrs[:storeType]
    @city = attrs[:city]
  end

end
