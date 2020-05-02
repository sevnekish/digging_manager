RSpec.describe 'Tickets show page', type: :feature do
  let(:ticket) { create(:ticket, :with_excavator) }
  let(:excavator) { ticket.excavator }

  let(:ticket_id) { ticket.id }

  let(:excavator_expected_address) do
    address = excavator.address

    [
      address['street'],
      address['city'],
      address['state'],
      address['zip']
    ].join(', ')
  end

  before do
    visit "/tickets/#{ticket_id}"
  end

  context 'when user visits the page of the existing ticket' do
    it 'renders ticket attributes' do
      expect(page).to have_content(ticket.request_number)
      expect(page).to have_content(ticket.request_type)
      expect(page).to have_content(ticket.sequence_number)
      expect(page).to have_content(ticket.primary_sa_code)
      expect(page).to have_content(ticket.additional_sa_codes.join(', '))
    end

    it 'renders ticket excavator attributes' do
      expect(page).to have_content(excavator.company_name)
      expect(page).to have_content(excavator.crew_on_site.to_s)
      expect(page).to have_content(excavator_expected_address)
    end
  end

  context 'when user visits the page of the not existing ticket' do
    let(:ticket_id) { 99_999 }

    it 'renders not found page' do
      expect(page).to have_content('Not found')
    end
  end
end
