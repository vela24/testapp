class User < ApplicationRecord
  require 'csv'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_acceptance_of :tos_agreement, allow_nil: false, on: :create

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.to_csv
    CSV.generate(col_sep: ";") do |csv|
      csv << attribute_names
      all.find_each do |record|
        csv << record.attributes.values
      end
    end

  end
end
