require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to(:airline) }
  end
end
