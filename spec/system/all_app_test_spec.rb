require 'rails_helper'

RSpec.describe 'User function', type: :system do

    before do
        @user = User.create(
          username: "User1",
          address: "Porto-Novo",
          telephone: "22967222311",
          email: "user1@gmail.com",
          password: "azerty",
          password_confirmation: "azerty"
        )

        @admin = User.create(
          username: "Admin",
          address: "Porto-Novo",
          telephone: "22967222311",
          email: "admin@gmail.com",
          password: "azerty",
          password_confirmation: "azerty",
          admin: true
        )


        @product2 = Product.create(
          name: "product2",
          description: "product2 description 2",
          image: File.open(File.join(Rails.root, "/app/assets/images/product-2.jpg")),
          category: nil,
          price: 50
        )
    end

  describe 'registration of user test' do
    context 'registration of user test' do
      it 'registration of user test' do
          visit new_user_registration_path

          fill_in "user[username]",	with: "testeur"
          fill_in "user[address]",	with: "Cotonou"
          fill_in "user[telephone]",	with: "22922237909"
          fill_in "user[email]",	with: "test@gmail.com"
          fill_in "user[password]",	with: "azerty"
          fill_in "user[password_confirmation]",	with: "azerty"
          click_on "Sign up"
          expect(page).to have_text 'Welcome to AfrikShop'
      end
    end
  end

  describe 'login users, verify he\'s not admin and logout test' do
    context 'login users, verify he\'s not admin and logout test' do
      it "login users, verify he's not admin and logout test" do
          visit new_user_session_path

          fill_in "user[email]",	with: @user.email
          fill_in "user[password]",	with: @user.password
          click_on "Log in"

          expect(page).to have_text 'Welcome to AfrikShop'
          expect(page).to have_no_link 'Admin'

          click_button "menu"

          click_button "menu"

          click_on "logout"
      end
    end
  end

  describe 'login users, verify he\'s not admin and logout test' do
    context 'login users, verify he\'s not admin and logout test' do
      it "login users, verify he's not admin and logout test" do
          visit new_user_session_path

          fill_in "user[email]",	with: @user.email
          fill_in "user[password]",	with: @user.password
          click_on "Log in"

          expect(page).to have_text 'Welcome to AfrikShop'
          expect(page).to have_no_link 'Admin'

          click_button "menu"

          click_button "menu"

          click_on "logout"
      end
    end
  end

  describe 'This user is admin' do
    context 'This user is admin' do
      it "is users is admin" do
          visit new_user_session_path

          fill_in "user[email]",	with: @admin.email
          fill_in "user[password]",	with: @admin.password
          click_on "Log in"

          expect(page).to have_text 'Welcome to AfrikShop'
          expect(page).to have_link 'Admin'
      end
    end
  end

  describe 'Consult the products and add to favory and delete to favory' do
    context 'Consult the products and add to favory and delete to favory' do
      it "Consult the products and add to favory and delete to favory" do

        visit new_user_session_path

        fill_in "user[email]",	with: @admin.email
        fill_in "user[password]",	with: @admin.password
        click_on "Log in"

        expect(page).to have_text 'Welcome to AfrikShop'

        visit products_path

        expect(page).to have_text 'product2'

        click_on "Favory"

        expect(page).to have_text '50'

        click_on "Delete"
      end
    end
  end

  # describe 'Login with guest user simple status' do
  #   context 'Login with guest user simple status' do
  #     it "Login with guest user simple status" do
  #
  #       visit new_user_session_path
  #
  #       click_on "Guest login"
  #
  #       expect(page).to have_text 'Welcome to AfrikShop'
  #     end
  #   end
  # end
  #
  # describe 'Login with guest user admin status' do
  #   context 'Login with guest user admin status' do
  #     it "Login with guest user admin status" do
  #
  #       visit new_user_session_path
  #
  #       click_on "Guest login Admin"
  #
  #       expect(page).to have_text 'Welcome to AfrikShop'
  #     end
  #   end
  # end

  describe "See details of product and add her to cart" do
    context 'See details of product and add her to cart' do
      it "See details of product and add her to cart" do

        visit new_user_session_path

        fill_in "user[email]",	with: @admin.email
        fill_in "user[password]",	with: @admin.password
        click_on "Log in"

        visit products_path

        visit product_path(@product2.id)

        expect(page).to have_text 'product2'

        visit add_cart_path(id: @product2.id, user_id: @admin.id)

        expect(page).to have_text 'product2'
      end
    end
  end

  describe "Choose the quantity and update the price" do
    context 'Choose the quantity and update the price' do
      it "Choose the quantity and update the price" do

        visit new_user_session_path

        fill_in "user[email]",	with: @admin.email
        fill_in "user[password]",	with: @admin.password
        click_on "Log in"

        visit products_path

        visit product_path(@product2.id)

        expect(page).to have_text 'product2'

        visit add_cart_path(id: @product2.id, user_id: @admin.id)

        expect(page).to have_text 'product2'

        click_on "Update"

        expect(page).to have_text '70$'
      end
    end
  end

  describe "Choose the quantity and update the price" do
    context 'Choose the quantity and update the price' do
      it "Choose the quantity and update the price" do

        visit new_user_session_path

        fill_in "user[email]",	with: @admin.email
        fill_in "user[password]",	with: @admin.password
        click_on "Log in"

        visit products_path

        visit product_path(@product2.id)

        expect(page).to have_text 'product2'

        visit add_cart_path(id: @product2.id, user_id: @admin.id)

        expect(page).to have_text 'product2'

        click_on "Update"

        click_on "Validate"

        expect(page).to have_text '70$'
        expect(page).to have_text "22967222311"
      end
    end
  end

  describe 'See user profil' do
    context 'See user profil' do
      it "See user profil" do

        visit new_user_session_path

        fill_in "user[email]",	with: @admin.email
        fill_in "user[password]",	with: @admin.password
        click_on "Log in"

        expect(page).to have_text 'Welcome to AfrikShop'

        click_button "menu"

        click_button "menu"

        click_on "Profil"

        expect(page).to have_text 'Edit'
      end
    end
  end
end
