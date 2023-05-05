module PizzaDimensions
  class DimensionsQuery < BaseQuery
    def initialize(_params)
      super
      @scope = PizzaDimension.all
      @data = {}
    end

    def call
      separated_attributes
      @data
    end

    def separated_attributes
      @scope&.each { |dimension| @data[dimension.dimension] = dimension.price_cents }
    end
  end
end
