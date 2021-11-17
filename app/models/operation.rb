class Operation < ApplicationRecord
  belongs_to :store
  belongs_to :recipient
end
