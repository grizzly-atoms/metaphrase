require 'rails_helper'

RSpec.describe Translation, type: :model do
  it { should validate_presence_of(:original_copy) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:translated_copy) }
  it do
    translation = Translation.new(original_copy: 'foo', code: 'en-us', translated_copy: 'foo')
    expect(translation).to allow_value(nil).for(:application_domain)
    expect(translation.application_domain).to eq 'default'
  end
end
