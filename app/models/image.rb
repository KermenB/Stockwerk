class Image < ApplicationRecord
    belongs_to :project


    def store_to_public
        dir = Rails.root.join("public", "project_images/#{project_id}").to_s
        Dir.mkdir(dir) unless File.exists?(dir)
        File.open(Rails.root.join("public", "project_images/#{project_id}/#{title}").to_s, 'wb') do |file|
            file.write(Base64.decode64(base64))
        end
    end

    def path
        "/project_images/#{project_id}/#{title}"
    end

    def self.store_all
        Image.all.each do |image|
            image.store_to_public
        end
    end
    
end
