json.extract! product, :id, :name, :peso_liquido, :peso_minimo, :peso_maximo, :created_at, :updated_at
json.url product_url(product, format: :json)
