class Plan < ActiveRecord::Base
  has_many :opinions, :dependent => :destroy
end
