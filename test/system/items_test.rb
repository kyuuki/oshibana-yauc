require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = FactoryBot.create(:item)
  end

  test "商品一覧ページ表示" do
    visit items_url
    assert_selector "h2", text: "商品一覧"
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
    click_on "保存"

    # 成功すると一覧画面の戻る
    assert_selector "h2", text: "商品一覧"
    assert_selector ".modal-dialog .alert", text: "登録しました。"

    # TODO: DB チェック
  end

  test "商品更新" do
    visit item_url(@item)
    click_on "編集"

    fill_in "商品番号", with: "1"
    fill_in "商品名", with: "x"
    click_on "保存"

    # 成功すると一覧画面の戻る
    assert_selector "h2", text: "商品一覧"
    #assert_text "更新しました。"  # タイミングによっては表示されていないことがあるので assert_selector でチェック
    assert_selector ".modal-dialog .alert", text: "更新しました。"

    # TODO: DB チェック
  end

  test "商品削除" do
    visit item_url(@item)
    click_on "削除"

    # 成功すると一覧画面の戻る
    assert_selector "h2", text: "商品一覧"
    assert_selector ".modal-dialog .alert", text: "削除しました。"

    # TODO: DB チェック
  end

  # TODO: どこまでテストするか
  # TODO: i18n のブラウザ切り替え
  # TODO: 軽い Validation エラーはここ？
end
