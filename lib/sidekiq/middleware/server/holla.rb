module Sidekiq
  module Middleware
    module Server
      class Holla
        def call worker, job, queue
          result = yield

          conn = Bunny.new ENV["RABBITMQ_URL"]
          conn.start

          mid = job["_holla_id"]

          ch = conn.create_channel
          ex = ch.queue "holla", durable: true

          ex.publish result.to_json, message_id: mid

          conn.close
        end
      end
    end
  end
end
