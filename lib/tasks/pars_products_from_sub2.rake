require 'mechanize'

namespace :utils do
  desc "Pars products from sub2_categories and save them to db"
  task(:pars_products_from_sub2_categories => :environment) do

    agent = Mechanize.new()

    Sub2LineItem.delete_all #Clear all rows in existing sub1_line_items table before fill it with new data

    hash = Sub2Category.all
=begin
    sub2 = Sub2Category.find_by(id: 86)
    page = agent.get("#{sub2.url}?___from_store=en&___store=en&limit=64&p=1")
    products_list = page.search("//li[starts-with(@class, 'item')]").to_a.first
    puts product_name = products_list.attributes["data-product-name"].to_s
=end

    hash.each do |cat|

      i = 1
      i_max = 1  #the number of pages for each sub1_category with 64 grid


      while i <= i_max

        begin
          page = agent.get("#{cat.url}?___from_store=en&___store=en&limit=64&p=#{i}")#geting the first page of sub1_category
        rescue Mechanize::RedirectLimitReachedError => error
          puts "This page is not available for parsing" + error.message
          i += 1
      next
        end


        #find the number of pages "i_max" for each sub1_category with 64 grid
        counter = page.search("//a[contains(@href,'#{cat.url.to_s}?___from_store=en&___store=en&limit=64&p=')]/text()").to_a
        counter.delete_if {|item| item.text.to_i<1}
        if counter.max.to_s.to_i > 1
          i_max = counter.max.to_s.to_i
        else
          i_max = 1
        end

        #find product's parameters
        puts "Sub2_category => #{cat.name}; id=#{cat.id}; Page number #{i}"

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

            #Creat line_item with just created product and it's sub2_category_id
            just_saved_product = Product.find_by(url: product_url)
            line = just_saved_product.sub2_line_items.build(:product_id=>just_saved_product.id,
                                                       :sub2_category_id=>cat.id
                                                       )
            puts "Created Sub2_LineItem for product #{product_name}!" if line.save

          else #if product already exist - creat new line_item for this product with this sub2_category_id
            puts "#{product_name} already exists in db"
            line = products.sub2_line_items.build(:product_id=>products.id,
                                             :sub2_category_id=>cat.id
                                            )
            puts "Created new Sub2_LineItem for the existing product!" if line.save
          end
        end #of product_list each_loop
        i += 1
      end #of while

      puts "---------------------------------------------"
    end # of hash_each
  end
end