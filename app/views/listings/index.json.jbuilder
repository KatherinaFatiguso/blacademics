json.array!(@listings) do |listing|
  json.extract! listing, :id, :type, :title, :subtitle, :description, :contact_name, :contact_email, :contact_phone, :website, :start_time, :end_time, :occurrence, :location, :ticket_required, :official_hastag, :facebook_url, :google_plus_url, :twitter_username, :instagram_username, :job_category, :job_type, :salary, :organisation_id
  json.url listing_url(listing, format: :json)
end
