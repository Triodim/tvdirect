require 'mechanize'

namespace :utils do
  desc "Pars products from main categories and save them to db"
  task(:pars_products_from_main_categories => :environment) do

    agent = Mechanize.new()

    LineItem.delete_all #Clear all rows in existing line_items table before fill it with new data

    hash = Category.all

    hash.each do |cat|

      i = 1
      i_max = 1  #the number of pages for each category with 64 grid

      while i <= i_max

        begin
        page = agent.get("#{cat.url}?___from_store=en&___store=en&limit=64&p=#{i}")#geting the first page of main category
        rescue Mechanize::RedirectLimitReachedError => error
          puts "This #{cat.url} page is not available for parsing" + error.message
          i += 1
          next
        end


        #find the number of pages "i_max" for each main category with 64 grid
        counter = page.search("//a[contains(@href,'#{cat.url.to_s}?___from_store=en&___store=en&limit=64&p=')]/text()").to_a
        counter.delete_if {|item| item.text.to_i<1}
        if counter.max.to_s.to_i > 1
          i_max = counter.max.to_s.to_i
        else
          i_max = 1
        end

        #find product's parameters
        puts "Main category => #{cat.name}; id=#{cat.id}; Page number #{i}"

        products_list = page.search("//li[starts-with(@class, 'item')]").to_a

        products_list.each do |product|

           product_name = product.attributes["data-product-name"].to_s
           product_price = product.search("span[@class = 'price']/text()").to_a.first.to_s.rstrip.chomp("Baht").strip.gsub(",","")
           product_sku = product.attributes["data-product-sku"].to_s
           product_url = product.search("a[@class = 'cover_link']/@href").to_s
          #puts "Decimal Price => " + BigDecimal.new(product_price).to_s
          #puts " "

          #Creat product and line_item for it
          products = Product.find_by(url: product_url)

          if !products #if product doesn't exist - creat new product and line_item
            product = Product.new(:name=>product_name,
                                  :url=>product_url,
                                  :price=>product_price,
                                  :sku=>product_sku
                                  )
            product.save
            puts "Product #{product_name} doesn't exist, saved to db"

            #Creat line_item with just created product and it's category_id
            just_saved_product = Product.find_by(url: product_url)
            line = just_saved_product.line_items.build(:product_id=>just_saved_product.id,
                                                       :category_id=>cat.id
                                                       )
            puts "Created LineItem for product #{product_name}!" if line.save

          else #if product already exist - creat new line_item for this product with this category_id
            puts "#{product_name} already exists in db"
            line = products.line_items.build(:product_id=>products.id,
                                             :category_id=>cat.id
                                            )
            puts "Created new LineItem for the existing product!" if line.save
          end
        end #of product_list each loop
        i += 1
      end #of while

      puts "---------------------------------------------"
    end # of each
  end
end