class User < ActiveRecord::Base
  has_many :call_requests
end
