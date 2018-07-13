json.extract! product, :id, :name, :peso, :peso_minimo, :peso_maximo, :created_at, :updated_at
json.url product_url(product, format: :json)
