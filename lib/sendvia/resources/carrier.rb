module Sendvia

  class Carrier < Base
    def services #work around for issue https://github.com/rails/activeresource/issues/16
      Service.all(params: { carrier_id: self.Id })
    end
  end
end
