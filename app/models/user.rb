class User < ActiveRecord::Base
  belongs_to :gender

  audited
end
