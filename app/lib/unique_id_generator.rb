require 'digest/sha1'

module UniqueIdGenerator
  def self.generateUUID(salt1, salt2)
    str = salt1.to_s + salt2.to_s
    Digest::SHA1.hexdigest(str)
  end
end
