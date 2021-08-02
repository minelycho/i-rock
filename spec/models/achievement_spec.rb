require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    it 'require title' do
      achievement = Achievement.new(title: '')
=begin
  #alternative syntax
      achievement.valid?
      expect(achievement.errors[:title]).to include('can\'t be blank')
      expect(achievement.errors[:title]).not_to be_empty
=end
      expect(achievement.valid?).to be_falsy
    end

    it 'renders title to be unique for one user' do
      user = FactoryBot.create(:user)
      first_achievement = FactoryBot.create(:public_achievement, title: 'First Achivement', user: user)
      new_achievement = Achievement.new(title: 'First Achivement', user: user)
      expect(new_achievement.valid?).to be_falsy
    end

    it 'allows different users to have achievements with identical titles' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      first_achievement = FactoryBot.create(:public_achievement, title: 'First Achivement', user: user1)
      new_achievement = Achievement.new(title: 'First Achivement', user: user2)
      expect(new_achievement.valid?).to be_truthy
    end
  end
end
