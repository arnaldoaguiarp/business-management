class Operation < ApplicationRecord
  belongs_to :store
  belongs_to :recipient
  belongs_to :category, foreign_key: :categorycode, primary_key: :code, optional: true

  accepts_nested_attributes_for :store
  accepts_nested_attributes_for :recipient
end
