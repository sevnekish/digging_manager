class Decorators::Ticket < SimpleDelegator
  def additional_sa_codes
    super.join(', ')
  end

  def excavator
    @excavator ||= begin
      return if super.blank?
      Decorators::Excavator.new(super)
    end
  end

  def digsite_info
    super&.coordinates&.[](0)
  end
end
