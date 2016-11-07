class User < ActiveRecord::Base
  has_many :gps_sample
end