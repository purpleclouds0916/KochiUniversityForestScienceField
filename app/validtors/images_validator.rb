class ImagesValidator < ActiveModel::EachValidator
    def validate(record)     
    #先生の紹介の動画以外
      unless record.tag_id == 8
        unless record.images.present?
            record.errors[:base] << "画像を入力してください"
        end
      end
    end
  end