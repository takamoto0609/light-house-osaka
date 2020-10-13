class LibraryController < ApplicationController
  def index
    @header_title = "ライブラリ"
  end

  def content_1
    @header_title = "ライブラリ > 基礎知識 Ver.1.0"
  end

  def content_2
    @header_title = "ライブラリ > アイテム Ver.1.0"
  end

  def content_3
    @header_title = "ライブラリ > 人生の落とし穴 Ver.1.0"
  end

  def content_4
    @header_title = "ライブラリ > 健康 Ver.1.0"
  end
end
