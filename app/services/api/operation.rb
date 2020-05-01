class Api::Operation
  attr_reader :params

  def self.inherited(subclass)
    subclass.class_eval do
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)
    end
  end

  def initialize(params)
    @params = params
  end
end
