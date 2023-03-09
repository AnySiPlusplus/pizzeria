class PizzaFilling < ApplicationRecord
  belongs_to :pizza
  belongs_to :filling
end
