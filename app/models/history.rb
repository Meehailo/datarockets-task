class History < ApplicationRecord
  # The task says I should have a "type" column.
  # On a real project I would ask the analyst if I can rename this column
  self.inheritance_column = :_type_disabled
end
