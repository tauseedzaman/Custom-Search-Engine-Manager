Import-Module PSSQLite    

$DataSource = "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Web Data"

# Define custom search engine information
$short_name = 'Ecosia'
$keyword = 'ecosia.or'
$favicon_url = 'https://www.ecosia.org/static/icons/favicon.ico'
$url = 'https://www.ecosia.org/search?method=index&q={searchTerms}'
$suggest_url = 'https://www.ecosia.org/suggest?q={searchTerms}'
$image_url = 'https://www.ecosia.org/images/search'

# Generate GUID
$guid = [guid]::NewGuid().ToString()

# Insert the new custom search engine entry
$InsertQuery = @"
INSERT INTO keywords (
    short_name, keyword, favicon_url, url, safe_for_autoreplace,
    originating_url, date_created, usage_count, input_encodings, suggest_url,
    prepopulate_id, created_by_policy, last_modified, sync_guid, alternate_urls,
    image_url, search_url_post_params, suggest_url_post_params, image_url_post_params,
    new_tab_url, last_visited, created_from_play_api, is_active, starter_pack_id,
    enforced_by_policy, featured_by_policy
) VALUES (
    '$short_name', '$keyword', '$favicon_url', '$url', 1,
    '', 0, 0, 'UTF-8', '$suggest_url', 5, 0, 0,
    '$guid', '[]', '$image_url', '', '', '', '', 0, 0, 1, 0, 0, 0
);
"@
Invoke-SqliteQuery -Query $InsertQuery -DataSource $DataSource

Write-Host "Query Executed Successfully."


#  CUSTOMIZE THIS CODE IF YOU WANA SET THE SEARCH ENGIN YOU JSUT ADDED AS DEFAULT

# Query the inserted row to get the id
# Start-Sleep -Seconds 1
# $SelectQuery = @"
# SELECT * FROM keywords WHERE short_name = '$short_name' AND keyword = '$keyword' AND sync_guid = '$guid';
# "@
# $result = Invoke-SqliteQuery -Query $SelectQuery -DataSource $DataSource

# # Extract the id from the query result
# $id = $result.id
# $result

# Update or add default_search_provider_data in Secure Preferences JSON
# $SecurePreferencesPath = "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Secure Preferences"
# $PreferencesPath = "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Preferences"

# $SecurePreferencesJson = Get-Content -Raw -Path $SecurePreferencesPath | ConvertFrom-Json
# $PreferencesJson = Get-Content -Raw -Path $PreferencesPath | ConvertFrom-Json

# $PreferencesJson.default_search_provider.guid = $guid


# $template_url_data = @{
#     alternate_urls                            = @()
#     choice_location                           = 1
#     contextual_search_url                     = ''
#     created_by_policy                         = 0
#     created_from_play_api                     = $false
#     date_created                              = "0"
#     doodle_url                                = ''
#     enforced_by_policy                        = $false
#     favicon_url                               = $favicon_url
#     featured_by_policy                        = $false
#     id                                        = $id
#     image_search_branding_label               = ''
#     image_translate_source_language_param_key = ''
#     image_translate_target_language_param_key = ''
#     image_translate_url                       = ''
#     image_url                                 = $image_url
#     image_url_post_params                     = ''
#     input_encodings                           = @("UTF-8")
#     is_active                                 = 1
#     keyword                                   = $keyword
#     last_modified                             = "0"
#     last_visited                              = "0"
#     logo_url                                  = ''
#     new_tab_url                               = ''
#     originating_url                           = ''
#     preconnect_to_search_url                  = $false
#     prefetch_likely_navigations               = $false
#     prepopulate_id                            = 5
#     safe_for_autoreplace                      = $true
#     search_intent_params                      = @()
#     search_url_post_params                    = ''
#     short_name                                = $short_name
#     side_image_search_param                   = ''
#     side_search_param                         = ''
#     starter_pack_id                           = 0
#     suggestions_url                           = $suggest_url
#     suggestions_url_post_params               = ''
#     synced_guid                               = $guid
#     url                                       = $url
#     usage_count                               = 0
# }

# if (-not $SecurePreferencesJson.default_search_provider_data) {
#     # Create default_search_provider_data if it doesn't exist
#     $SecurePreferencesJson | Add-Member -Type NoteProperty -Name default_search_provider_data -Value @{
#         template_url_data = $template_url_data
#     }
# }
# else {
#     # Update existing default_search_provider_data
#     $SecurePreferencesJson.default_search_provider_data.template_url_data = $template_url_data
# }

# # Convert updated JSON back to string
# $UpdatedSecurePreferencesJson = $SecurePreferencesJson | ConvertTo-Json -Depth 10
# $UpdatedPreferencesJson = $PreferencesJson | ConvertTo-Json -Depth 10

# # Write updated JSON back to file
# $UpdatedSecurePreferencesJson.Trim() -replace '\r?\n', '' -replace '\s+', ' ' | Set-Content -Path $SecurePreferencesPath -Encoding UTF8
# $UpdatedPreferencesJson.Trim() -replace '\r?\n', '' -replace '\s+', ' ' | Set-Content -Path $PreferencesPath -Encoding UTF8
