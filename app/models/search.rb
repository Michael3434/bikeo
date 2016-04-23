class Search
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :date
  attribute :guests
  attribute :locality
  attribute :zipcode, String
  attribute :distance, Integer
  attribute :pack_type, String

end
