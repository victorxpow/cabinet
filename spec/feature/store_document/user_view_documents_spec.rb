require 'rails_helper'

feature 'User view all documents' do
  scenario 'Sucessfully' do
    document = create(:document)
    
    visit root_path
    click_on 'Documentos'

    expect(page).to have_content(document.title)
    expect(page).to have_content(document.body)
    expect(page).to have_content(document.document_id)
  end

  xscenario 'User view document' do
    login_as user, scope: :user
    visit root_path
    click_on 'Documentos'
    within("tr#document-#{document.id}") do
      find("a[href='#{order_path(document)}'][data-method='get']").click
    end

    expect(page).to have_content(document.user.id)
    expect(page).to have_content(document.title)
    expect(page).to have_content(document.body)
    expect(page).to have_content(document.document_id)
  end
end