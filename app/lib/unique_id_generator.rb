require 'digest/sha1'

module UniqueIdGenerator
  def self.generateUUID(salt1)
    Digest::SHA1.hexdigest(salt1.to_s)
  end
end
