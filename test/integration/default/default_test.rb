# # encoding: utf-8

# Inspec test for recipe windows_ad::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe os.windows? do
  it { should eq true }
end

# Uses Name Property for Get-WindowsFeature to verify
if os.release >= '6.2'
  describe windows_feature('GPMC') do
    it { should be_installed }
  end
  describe windows_feature('RSAT') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-Role-Tools') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-AD-Tools') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-ADDS-Tools') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-AD-Powershell') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-ADDS-Tools') do
    it { should be_installed }
  end
  describe windows_feature('RSAT-AD-AdminCenter') do
    it { should be_installed }
  end
  describe windows_feature('AD-Domain-Services') do
    it { should be_installed }
  end    
end

# Uses execute resource to run dism commands
if os.release < '6.2'
  describe command('dism /online /get-featureinfo /featurename:NetFx3') do
    its('stdout') { should include 'State : Enabled' }
  end
  describe command('dism /online /get-featureinfo /featurename:Microsoft-Windows-GroupPolicy-ServerAdminTools-Update') do
    its('stdout') { should include 'State : Enabled' }
  end
  describe command('dism /online /get-featureinfo /featurename:DirectoryServices-DomainController') do
    its('stdout') { should include 'State : Enabled' }
  end
end
