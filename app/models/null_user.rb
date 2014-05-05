class NullUser
  def method_missing(*args, &block)
    nil
  end

  def can_edit?(*args, &block)
   false
  end

  def can_claim?(*args, &block)
    true
  end

  def can_create_volunteer_op?(*args, &block)
    false
  end
end
