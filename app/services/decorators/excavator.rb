class Decorators::Excavator < SimpleDelegator
  def full_address
    [
      address.fetch('street'),
      address.fetch('city'),
      address.fetch('state'),
      address.fetch('zip')
    ].compact.join(', ')
  end
end
