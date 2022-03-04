# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'プロを目指す人のためのRuby入門'
    assert_text '名著です！'
    assert_text '伊藤淳一'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: '現場で使えるRubyonRails5'
    fill_in 'メモ', with: 'ステップバイステップで学べオススメです！'
    fill_in '著者', with: '株式会社万葉'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text '現場で使えるRubyonRails5'
    assert_text 'ステップバイステップで学べオススメです！'
    assert_text '株式会社万葉'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text 'プロを目指す人のためのRuby入門'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text 'プロを目指す人のためのRuby入門'
  end
end
