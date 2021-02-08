class TeacherValidator < ActiveModel::EachValidator
    def validate(record)      
    #先生の紹介のバリデーション
      if record.tag_id == 4
        unless record.teacher.name.present?
            record.errors[:base] << "先生の名前を入力してください"
        end

        unless record.teacher.job.present?
            record.errors[:base] << "先生の役職を入力してください"
        end
      end
    end
  end