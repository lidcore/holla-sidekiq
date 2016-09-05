module Sidekiq
  module Middleware
    module Client
      class Holla
        def call worker_class, job, queue, redis_pool
          job["_holla_id"] = job["args"].pop

          yield
        end
      end
    end
  end
end
