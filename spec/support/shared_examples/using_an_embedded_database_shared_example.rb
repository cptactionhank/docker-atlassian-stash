shared_examples 'using an embedded database' do
	before :all do
		choose 'Internal'
		click_button 'Next'
		wait_for_page
	end

	it { expect(current_path).to match '/setup' }
  it { is_expected.to have_field 'license' }
  it { is_expected.to have_button 'Next' }
end
