class UserForm < Reform::Form
  property :email
  property :name

  validates :email, :name, presence: true, on: :create
  validates_uniqueness_of :email
  validate :email_format

  private
  
  def email_format
    return unless email
    
    errors.add(:email, :email, message: 'Wrong email format') unless !!email.match(URI::MailTo::EMAIL_REGEXP)
  end
end
