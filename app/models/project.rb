class Project < ApplicationRecord
     has_many :images

    def store_to_public
        dir = Rails.root.join("public", "project_images/#{id}").to_s
        Dir.mkdir dir unless File.exists?(dir)
        File.open(Rails.root.join("public", "project_images/#{id}/#{main_img}").to_s, 'wb') do |file|
            file.write(Base64.decode64(main_img_base64))
        end
    end

    def img_path
        "/project_images/#{id}/#{main_img}"
    end

    def self.store_all
        Project.all.each do |project|
            project.store_to_public
        end
    end
end
