# frozen_string_literal: true

require 'test_helper'

class Users::UserDeletedEventTest < ActiveSupport::TestCase
  test 'the event is persisted with all the necessary attributes' do
    account = FactoryBot.create(:simple_provider, provider_account: master_account)
    user = FactoryBot.create(:user, account: account)

    event = Users::UserDeletedEvent.create(user)
    Rails.application.config.event_store.publish_event(event)

    event_stored = EventStore::Repository.find_event!(event.event_id)
    assert_equal user.id, event_stored.user_id
    assert_equal event.metadata[:provider_id], master_account.id
  end

  test 'the event is created when the user is destroyed' do
    account = FactoryBot.create(:simple_provider, provider_account: master_account)
    user = FactoryBot.create(:user, account: account)

    user.destroy!

    # EventStore::Event.where(event_type: Users::UserDeletedEvent)
    binding.pry
  end

  test 'the event is persisted and with the necessary attributes when its associations are already destroyed' do
    skip 'TODO - WIP'
  end
end
