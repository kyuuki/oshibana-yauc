require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "#yauc_name" do
    item = FactoryBot.create(:item_1)

    assert_equal("押し花素材 No.1: 名前 1", item.yauc_name)
  end

  test "#yauc_detail_html" do
    item = FactoryBot.create(:item_1)

    assert item.yauc_detail_html.include?("名前 1")
    assert item.yauc_detail_html.include?("押し花ブログ")
  end
end
