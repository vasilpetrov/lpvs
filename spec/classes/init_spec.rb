require 'spec_helper'
describe 'lpvs' do

  context 'with defaults for all parameters' do
    it { should contain_class('lpvs') }
  end
end
