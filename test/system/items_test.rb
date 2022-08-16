require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = FactoryBot.create(:item, number: 1234, name: "名前 5678")
  end

  test "トップページ表示" do
    visit root_url

    # トップページは商品一覧
    assert_selector "h2", text: "商品一覧"
  end

  test "商品一覧ページ表示" do
    visit items_url

    assert_selector "h2", text: "商品一覧"

    # どこかに商品情報が表示されていること
    assert_selector "table tr td", text: "1234"  # TODO: 部分一致？
    assert_selector "table tr td", text: "名前 5678"
  end

  test "商品一覧ページ → 商品登録ページ表示" do
    visit items_url
    click_on "新規登録"
    assert_selector "h2", text: "商品登録"
  end

  # TODO: 一覧ページからの全部の画面遷移

  test "商品保存" do
    visit items_url
    click_on "新規登録"

    fill_in "商品番号", with: @item.number
    fill_in "商品名", with: @item.name

    assert_difference "Item.count", 1 do
      click_on "保存"

      # 成功すると一覧画面の戻る
      assert_selector "h2", text: "商品一覧"
      assert_selector ".modal-dialog .alert", text: "登録しました。"
    end
  end

  test "商品更新" do
    visit item_url(@item)
    click_on "編集"

    fill_in "商品番号", with: "1"
    fill_in "商品名", with: "x"

    assert_no_difference "Item.count" do
      click_on "保存"

      # 成功すると一覧画面の戻る
      assert_selector "h2", text: "商品一覧"
      #assert_text "更新しました。"  # タイミングによっては表示されていないことがあるので assert_selector でチェック
      assert_selector ".modal-dialog .alert", text: "更新しました。"
    end

    # DB 更新チェック
    item = Item.find_by(number: 1)
    assert_equal "x", item.name
  end

  test "商品削除" do
    visit item_url(@item)

    assert_difference "Item.count", -1 do
      click_on "削除"

      # 成功すると一覧画面の戻る
      assert_selector "h2", text: "商品一覧"
      assert_selector ".modal-dialog .alert", text: "削除しました。"
    end
  end

  # TODO: どこまでテストするか
  # TODO: i18n のブラウザ切り替え
  # TODO: 軽い Validation エラーはここ？
end
