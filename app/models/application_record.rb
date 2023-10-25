class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  MIN_STRING_LENGTH = 2
end
