# # encoding: utf-8

# Inspec test for recipe windows_ad::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe os.windows? do
  it { should eq true }
end



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

if os.release < '6.2'
  describe windows_feature('NetFx3') do
      it { should be_installed }
  end
  describe windows_feature('AD-Domain-Services') do
    it { should be_installed }
  end
end
