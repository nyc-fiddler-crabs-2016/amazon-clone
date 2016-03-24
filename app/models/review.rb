class Review < ActiveRecord::Base
  belongs_to :rater, class_name:"User", foreign_key: "user_id"
  belongs_to :rated_item, class_name:"Item", foreign_key: "item_id"
end
