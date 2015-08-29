class User
  include Mongoid::Document
  include Mongoid::Paperclip
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## 追加
  field :name, type: String, default: '匿名'
  field :single, type: Boolean

  field :wife_name, type: String, default: '匿名'
  field :wife_email, type: String
  field :wedding_day, type: Date

  embeds_many :comments

  has_mongoid_attached_file :wife_image,
    :styles => { :medium => '100x100#', :thumb => ['24x24#', :jpg] },
    :path => "app/assets/images/uploaded/:attachment/:id/:style/:filename",
    :url => "uploaded/:attachment/:id/:style/:filename"
  validates_attachment_content_type :wife_image, :content_type => %w(image/jpeg image/jpg image/png image/gif)

  has_mongoid_attached_file :family_image,
    :styles => { :medium => '100x100#', :thumb => ['24x24#', :jpg] },
    :path => "app/assets/images/uploaded/:attachment/:id/:style/:filename",
    :url => "uploaded/:attachment/:id/:style/:filename"
  validates_attachment_content_type :family_image, :content_type => %w(image/jpeg image/jpg image/png image/gif)
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
