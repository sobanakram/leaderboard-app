class Score < ApplicationRecord

  def self.insert_all_with_timestamp(attributes)
    timestamp = Time.zone.now
    attributes = attributes.map do |hash|
      hash[:created_at] = hash[:updated_at] = timestamp
      hash
    end
    insert_all(attributes)
  end
end
