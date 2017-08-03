class StravaImportJob < ApplicationJob
  queue_as :default

  def perform(user, access_token)
    @client = StravaService.client(access_token)
    # activities, need to count them, store them and re-assign it by page
    strava_activities = get_strava_activities
    remaining_activities = strava_activities.keys - user.logs.pluck(:strava_id)
    remaining_activities.each do |activity_id|
      activity = strava_activities[activity_id]
      user.logs.create(distance: (activity['distance'] / 1609.344),
                       travel_type: 'manual',
                       notes: activity['description'],
                       strava_id: activity_id,
                       name: activity['name'],
                       activity_date: DateTime.strptime(activity['start_date']))
    end
  end

  private

  def get_strava_activities(page=1, activities={})
    current_activities = @client.list_athlete_activities(per_page: 200, page: page)
    current_activities.each do |obj|
      activities[obj["id"]] = obj
    end
    get_strava_activities(page + 1, activities) if current_activities.count == 200
    activities
  end
end
