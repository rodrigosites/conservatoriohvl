class Leciona < ActiveRecord::Base
  belongs_to :curso
  belongs_to :professor
end
