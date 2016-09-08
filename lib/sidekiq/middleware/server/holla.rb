module Sidekiq
  module Middleware
    module Server
      class Holla
        def call worker, job, queue
          result = yield

          conn = Bunny.new

          puuid = job["_holla_id"]

          ch = conn.create_channel
          ex = ch.queue "holla", durable: true

          ex.publish result.to_json, headers: { holla: { pipeline: puuid } }

          conn.close
        end
      end
    end
  end
end
