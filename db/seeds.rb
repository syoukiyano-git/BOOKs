require "csv"

products_csv = CSV.readlines("db/products.csv")
products_csv.each do |row|
    Product.create(title: row[1], image_url: row[2], author: row[5])
end 