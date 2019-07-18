require 'spec_helper'
describe 'icingaPostgres' do
  context 'with default values for all parameters' do
    it { should contain_class('icingaPostgres') }
  end
end
