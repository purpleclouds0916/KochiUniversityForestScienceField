class UrlValidator < ActiveModel::EachValidator
    def validate(record)
    #森林科学領域,授業の紹介,先生の紹介の動画のバリデーション
      if record.tag_id == 3 || record.tag_id == 5 || record.tag_id == 8
        unless record.url.first.movie_url.present?
            record.errors[:base] << "動画のURLを入力してください"
        end
      end
    end
end