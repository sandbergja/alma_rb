# frozen_string_literal: true

module Alma
  class UserRequest < AlmaRecord
    extend Alma::ApiDefaults

    def self.where_user(user_id, args = {})
      # Default to upper limit
      args[:limit] ||= 100
      response = HTTParty.get(
        "#{users_base_path}/#{user_id}/requests",
        query: args,
        headers:,
        timeout:
      )
      Alma::RequestSet.new(response)
    end
  end
end
