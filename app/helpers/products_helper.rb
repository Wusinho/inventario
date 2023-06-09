module ProductsHelper

  def nested_inventory_purchases(product, f)
    return if product.persisted?

    render 'inventory_purchases/form', f: f
  end

    def product_categories_select(product, f)
      options = { multiple: true, class: 'form-select', id: 'validationTagsThreshold', data: { controller: 'tag-select', allow_clear: true, suggestions_threshold: 0 } }
      select = { include_blank: true }

      select[:selected] = product.category_ids if product.persisted?
      f.collection_select(:product_categories_attributes, product.all_categories, :id, :name, select, options)

    end

  def faulty_checkbox(f, product)
    return unless product.persisted?

    content_tag :div, class: 'mb-3' do
      concat f.label :faulty, class: 'mx-3'
      concat f.check_box :faulty, { checked: product.faulty }
    end
  end

  def faulty_prod_card(product)
    css = 'card'
    css += ' border-danger border-3' if product.faulty
    css += ' with_stock' unless product.out_of_stock?
    css
  end

  def product_form(product)
    product.persisted? ? '': 'd-none'
  end

  def render_image(product)
    if product.image_data.present?
      cl_image_tag(product.image_data.filename, width: 400, height: 400, crop: :fill, class: 'img-fluid')
    else
      image_tag('no_image.jpg',class: 'img-fluid')
    end
  end

end
