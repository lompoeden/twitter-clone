class Tweeet < ApplicationRecord
validates_length_of :tweeet, :within =>1...140
end
