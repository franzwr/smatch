class Player < ActiveRecord::Base
  has_many :friends, :dependent => :destroy
end
