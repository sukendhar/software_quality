class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  #    :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable
  # ":invitable" -- NEW IN 1CLICK

  # Setup accessible (or protected) attributes for your model
  # :OPT_IN IS NOT IN 1CLICK
  attr_accessible :name, :email, :remember_me, :confirmed_at, :opt_in
  attr_accessible :password, :password_confirmation

  after_create :add_user_to_mailchimp unless Rails.env.test?
  before_destroy :remove_user_from_mailchimp unless Rails.env.test?

  validates_confirmation_of :password

  # override Devise method
  # no password is required when the account is created;
  #    validate password when the user sets one
  def password_required?
    if !persisted?
      !(password != "")    ## WAS: false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  # override Devise method
  def confirmation_required?
    false
  end

  # override Devise method
  def active_for_authentication?
    confirmed? || confirmation_period_valid?
  end

  # new function to set the password
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to determine whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method pending_any_confirmation
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  private

  def add_user_to_mailchimp
    unless self.email.include?('@example.com') or !self.opt_in?
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "visitors"
      info = { }
      result = mailchimp.list_subscribe(list_id, self.email, info, 'html',
        false, true, false, true)
      Rails.logger.info(
        "MAILCHIMP SUBSCRIBE: result #{result.inspect} for #{self.email}")
    end
  end

  def remove_user_from_mailchimp
    unless self.email.include?('@example.com') or !self.opt_in?
      mailchimp = Hominid::API.new(ENV["MAILCHIMP_API_KEY"])
      list_id = mailchimp.find_list_id_by_name "visitors"
      result = mailchimp.list_unsubscribe(list_id, self.email, true, false,
        true)

      Rails.logger.info(
        "MAILCHIMP UNSUBSCRIBE: result #{result.inspect} for #{self.email}")
    end
  end

end
