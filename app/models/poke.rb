class Poke < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  after_create { self.delay.add_to_mailchimp_segment }

  def add_to_mailchimp_segment
    if !Rails.env.test?
      begin
        Gibbon::API.lists.subscribe(id: ENV["MAILCHIMP_LIST_ID"], email: {email: self.user.email}, merge_vars: {FNAME: self.user.first_name, LNAME: self.user.last_name, CITY: self.user.city}, double_optin: false, update_existing: true)
        Gibbon::API.lists.static_segment_members_add(id: ENV["MAILCHIMP_LIST_ID"], seg_id: ENV["MAILCHIMP_SEGMENT_ID"], batch: [{email: self.user.email}])
      rescue Exception => e
        Rails.logger.error e
      end
    end
  end
end
