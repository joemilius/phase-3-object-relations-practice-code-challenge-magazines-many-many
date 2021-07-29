class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    readers.pluck(:email).join(';')
  end

  def self.most_popular
    includes(:subscriptions).all.max_by {|mag| mag.subscriptions.length}
  end
end