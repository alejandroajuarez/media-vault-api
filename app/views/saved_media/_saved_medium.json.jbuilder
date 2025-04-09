# Saved Media Stuff
json.id             saved_medium.id
json.media_status   saved_medium.media_status
json.rating         saved_medium.rating
json.progress       saved_medium.progress
json.favorite       saved_medium.favorite

# Saved Media Association
json.user_id        saved_medium.user_id
json.media_id       saved_medium.media_entry.id

# Media Entry Association
json.title          saved_medium.media_entry.title
json.description    saved_medium.media_entry.description
json.media_type     saved_medium.media_entry.media_type
json.image_url      saved_medium.media_entry.image_url
json.creator        saved_medium.media_entry.creator