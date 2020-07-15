class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :userid, :email

  # need to create SESSIONS for the active user
  # and terminate on signing out

  # need to create ADMIN user - and restrict areas to only the ADMIN

end
