class BearShout < ActiveRecord::Base
  validates_presence_of :name, :content
end
