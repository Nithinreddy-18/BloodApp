
require 'rails_helper'

describe StaticPagesController do
  # let(:user) { FactoryGirl.create(:user) }

  # before(:each) do
  #   sign_in user
  # end

  describe 'GET about' do
    it 'renders the about template' do
      get :about
      expect(response).to render_template :about
    end
  end

end

