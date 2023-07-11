class UserRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :email
  property :name
end