class Encoder < User
  default_scope { where(role: :encoder) }
end
