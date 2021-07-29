class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price)
  end

  def total_subcription_price
    self.subscriptions.map {|subscription| subscription.price}.sum
  end

  def cancel_subscription(magazine)
    subscriptions.find_by(magazine_id: magazine.id).destroy
  end
end