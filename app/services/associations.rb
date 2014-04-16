module Associations

  def belongs_to? yours
    method_call = yours.class.to_s.underscore
    self.respond_to?(method_call) ? self.send(method_call) == yours : false
  end

end