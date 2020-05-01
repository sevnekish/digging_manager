module HashHelper
  def dig_set(hash, keys, value)
    *key, last = [*keys]
    key.inject(hash, :fetch)[last] = value
  end
end
