require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # scenario "Add to Cart" do
  #   # ACT
  #   visit root_path
  #   expect(page).to have_css 'article.product', count: 1
  #   click_on 'Add'
  #   expect(page).to have_text 'My Cart (1)', count: 1
  # end

  scenario "Add to Cart" do
    # ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 1
    click_on 'Add'
    click_on 'My Cart (1)'
    expect(page).to have_content '$64.99', count: 3
    save_screenshot
    # DEBUG / VERIFY
  end

end

