# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rtq_session',
  :secret      => 'e83b67a32d6432f63086f50d1a2540cf509c185dc8eaa7f133ec6cd1c87bbd53c473e209ba999f911102056d7d38af438cc2f13f6ed0c0700f4211490a110ab0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
