RSpec.describe 'Tickets index page', type: :feature do
  let!(:ticket_1) { create(:ticket, :with_excavator) }
  let!(:ticket_2) { create(:ticket, :with_excavator) }

  before { visit '/tickets' }

  it 'renders tickets' do
    expect(page).to have_content(ticket_1.request_number)
    expect(page).to have_content(ticket_1.excavator.company_name)

    expect(page).to have_content(ticket_2.request_number)
    expect(page).to have_content(ticket_2.excavator.company_name)
  end

  context 'when user click on ticket show page link' do
    it 'renders tickets appropriate ticket show page' do
      find(:xpath, "//a[@href='/tickets/#{ticket_2.id}']").click

      expect(page).to have_content(ticket_2.request_number)
      expect(page).to have_content(ticket_2.primary_sa_code)
    end
  end
end
