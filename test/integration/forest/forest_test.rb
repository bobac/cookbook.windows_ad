# # encoding: utf-8

# Inspec test for recipe windows_ad::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('[ADSI]::Exists("LDAP://contoso.local")') do
  its('stdout') { should include 'True' }
end
