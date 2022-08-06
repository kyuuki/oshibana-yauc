ActionView::Base.field_error_proc = proc do |html_tag, instance|
   html_doc = Nokogiri::HTML::DocumentFragment.parse(html_tag, Encoding::UTF_8.to_s)
   element = html_doc.children[0]

   if element
     element.add_class('is-invalid')
     instance.raw html_doc.to_html
   else
     html_tag
   end
end
