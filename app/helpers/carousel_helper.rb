module CarouselHelper
  def carousel_for(images)
    Carousel.new(self, images).html
  end

  class Carousel
    def initialize(view, images)
      @view, @images = view, images
      @uid = SecureRandom.hex(6)
    end

    def html
      # TO FILL IN
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide', 'data-bs-ride': "carousel")
    end

    private

    attr_accessor :view, :images, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      # TO FILL IN
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: { 
          target: uid, 
          slide_to: index 
        }
      }

      content_tag(:li, '', options)
    end
  
    def slides
      # TO FILL IN
      items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(image, is_active)
      options = {
        class: (is_active ? 'carousel-item d-block w-100 active' : 'carousel-item d-block w-100'),
      }

      content_tag(:div, image_tag(image,  class: "slider_imgs"), options)
    end

    def controls
      # TO FILL IN
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "carousel-control-#{direction == 'left' ? 'prev' : 'next'}",
        role: 'button',
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, nil, class: "carousel-control-#{direction == 'left' ? 'prev' : 'next'}-icon")
      control = link_to(icon, "##{uid}", options)
    end
  end
end