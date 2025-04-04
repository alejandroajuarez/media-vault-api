require "test_helper"

class MediaEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get title" do
    get media_entries_title_url
    assert_response :success
  end

  test "should get description" do
    get media_entries_description_url
    assert_response :success
  end

  test "should get media_type" do
    get media_entries_media_type_url
    assert_response :success
  end

  test "should get image_url" do
    get media_entries_image_url_url
    assert_response :success
  end

  test "should get creator" do
    get media_entries_creator_url
    assert_response :success
  end
end
