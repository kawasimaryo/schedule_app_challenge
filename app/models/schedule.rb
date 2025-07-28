class Schedule < ApplicationRecord
  # 必須バリデーション
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  # メモの文字数制限（任意入力だが上限あり）
  validates :memo, length: { maximum: 500 }, allow_blank: true

  # 終了日は開始日以降であること（自作バリデーション）
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を入力してください")
    end
  end
end
