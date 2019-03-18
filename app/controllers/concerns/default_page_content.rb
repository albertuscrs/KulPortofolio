module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Kul Potofolio | My Portfolio Website"
        @seo_keywords = "Kulolaleli Portfolio"
    end
end