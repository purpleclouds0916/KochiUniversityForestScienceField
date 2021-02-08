class AlumniValidator < ActiveModel::EachValidator
    def validate(record)      
    #卒業生の声のバリデーション

      if record.tag_id == 6
        unless record.alumni.name.present?
            record.errors[:base] << "卒業生の名前を入力してください"
        end

        unless record.alumni.job.present?
            record.errors[:base] << "職業を入力してください"
        end

        unless record.alumni.birthplace.present?
            record.errors[:base] << "出身地を入力してください"
        end

        unless record.alumni.job_description.present?
            record.errors[:base] << "職場での仕事内容を入力してください"
        end

        unless record.alumni.original_content.present?
            record.errors[:base] << "決めたタイトルについて入力してください"
        end

        unless record.alumni.original_title.present?
            record.errors[:base] << "好きなタイトルを入力してください"
        end
        
        unless record.alumni.reason.present?
            record.errors[:base] << "進学理由を入力してください"
        end

        unless record.alumni.research_field.present?
            record.errors[:base] << "研究内容を入力してください"
        end

        unless record.alumni.research_office.present?
            record.errors[:base] << "研究室を入力してください"
        end

        unless record.alumni.learning.present?
            record.errors[:base] << "森林科学領域での学びを入力してください"
        end

        unless record.alumni.memories.present?
            record.errors[:base] << "大学での経験や思い出を入力してください"
        end
      end
    end
  end