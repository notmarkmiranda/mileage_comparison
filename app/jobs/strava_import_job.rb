class StravaImportJob < ApplicationJob
  queue_as :default

  def perform(user, access_token)
    @client = StravaService.client(access_token)
    strava_activities = get_strava_activities
    return unless user.strava_local_dissonance?(strava_activities.count)
    remaining_activities = strava_activities.keys - user.logs.pluck(:strava_id)
    remaining_activities.each do |activity_id|
      activity = strava_activities[activity_id]
      create_user_log(user, activity)
    end
  end

  private

  def create_user_log(user, activity)
    user.logs.create(distance: (activity['distance'] / 1609.344),
                     travel_type: 'manual',
                     notes: activity['description'],
                     strava_id: activity['id'],
                     name: activity['name'],
                     activity_date: DateTime.strptime(activity['start_date']))
  end

  def get_strava_activities(page=1, activities={})
    current_activities = @client.list_athlete_activities(per_page: 200, page: page)
    current_activities.each { |obj| activities[obj["id"]] = obj }
    get_strava_activities(page + 1, activities) if current_activities.count == 200
    activities
  end
end
