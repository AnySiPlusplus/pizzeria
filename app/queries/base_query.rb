class BaseQuery
  attr_reader :params

  def initialize(params, current_user = nil)
    @current_user = current_user
    @params = params
  end
end
