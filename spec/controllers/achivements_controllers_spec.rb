require 'rails_helper'

describe AchievementsController do
  describe 'GET new' do
    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assings new Achievement to @achievement' do
      get :new
      expect(assigns(:achievement)).to be_a_new(Achievement)
    end
  end

  describe 'GET show' do
    let(:achievement) { FactoryBot.create(:public_achievement)}

    it 'renders :show template' do
      get :show, params: {id: achievement.id}
      expect(response).to render_template(:show)
    end

    it 'assings requested achievement to @achievement' do
      get :show, params: {id: achievement.id}
      expect(assigns(:achievement)).to eq(achievement)
    end
  end

  describe 'POST create' do
    context 'valid data' do
      let(:valid_data){FactoryBot.attributes_for(:public_achievement)}
      it 'redirects to achievements#show' do
        post :create, params: { achievement: valid_data }
        expect(response).to redirect_to(achievements_path(assigns[:achievement]))
      end
      it 'creates new achievement in database' do
        expect {
          post :create, params: { achievement: valid_data }
        }.to change(Achievement, :count).by(1)
      end
    end
    context 'invalid data' do
      let(:invalid_data) {FactoryBot.attributes_for(:public_achievement, title: '')}
      it 'renders :new template' do
        post :create, params: { achievement: invalid_data }
        expect(response).to render_template(:new)
      end
      it 'does\'t create new achievement in the database' do
        expect{
          #this replace the old syntax post :create, achievement: FactoryGirl.attributes_for(:public_achivement, title: '')
          #params = FactoryBot.attributes_for(:public_achievement, title: '')
          post :create, params: { achievement: invalid_data }
        }.not_to change(Achievement, :count)
      end
    end
  end
end
