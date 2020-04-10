require 'rails_helper'

feature 'User view all documents' do
  scenario 'Sucessfully' do
    document = create(:document)
    
    visit root_path
    click_on 'Documentos'

    expect(page).to have_content(document.title)
    expect(page).to have_content(document.id)
  end

  scenario 'User view document' do
    document = create(:document)

    visit root_path
    click_on 'Documentos'
    click_on document.title

    expect(page).to have_content(document.title)
    expect(page).to have_content(document.body)
    expect(page).to have_content(document.id)
  end
  xscenario 'User view document' do
    within("tr#document-#{document.id}") do
    find("a[href='#{order_path(document)}'][data-method='get']").click
    end
  end
end