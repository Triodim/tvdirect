require 'mechanize'


namespace :utils do
  desc "Pars categories and sub1 and sub2 structure and save it to db"
  task(:pars_categories_sub1_sub2 => :environment) do



    agent = Mechanize.new()
    category = nil
    sub1 = nil
    begin
      page = agent.get("https://www.tvdirect.tv/health?___from_store=th&___store=en")
      rescue Mechanize::RedirectLimitReachedError => error
      puts "The main page is not available for parsing" + error.message
    end


    cat_url_list = page.search("//a[starts-with(@class, 'level0')]/@href").to_a   #find all main categories's urls


    cat_url_list.each do |cat_url|

      name = page.search("//a[@href='#{cat_url.to_s}']").text

      categories = Category.find_by(name: name)

      if !categories
        category = Category.new(:name=>name,
                                :url=>cat_url
                                )
        category.save
        puts "Main category '#{name}' category doesn't exist, saved to db #{name} => #{cat_url}"
      else
        puts "Main category '#{name}' already exists in db"
      end

      #find all sub1categories's urls belong to carrent main category
      sub1_url_list = page.search("//a[contains(@href, '#{cat_url}')][starts-with(@class, 'level1')]/@href").to_a

      sub1_url_list.each do |sub1_url|

        sub1_name = page.search("//a[@href='#{sub1_url.to_s}'][starts-with(@class, 'level1')]").text

        sub1_category = Sub1Category.find_by(name: sub1_name)

        if !sub1_category
          sub1 = category.sub1_categories.build(:name=>sub1_name,
                                               :url=>sub1_url,
                                               :category_id=>category.id
                                                )
          sub1.save
          puts "--\"#{sub1_name}\" sub1 category doesn't exist, saved to db #{sub1_name} => #{sub1_url}"
        else
          puts "--Sub1Category \"#{sub1_name}\" already exists in db"
        end


        #find all sub2categories's urls belong to carrent sub1category
        sub2_url_list = page.search("//a[contains(@href, '#{sub1_url}')][starts-with(@class, 'level2')]/@href").to_a

        sub2_url_list.each do |sub2_url|

          sub2_name = page.search("//a[@href='#{sub2_url.to_s}'][starts-with(@class, 'level2')]").text

          sub2_category = Sub2Category.find_by(name: sub2_name)

          if !sub2_category
            sub2 = sub1.sub2_categories.build(:name=>sub2_name,
                                            :url=>sub2_url,
                                            :sub1_category_id=>sub1.id
                                            )
            sub2.save
            puts "----\"#{sub2_name}\" sub2 category doesn't exist, saved to db #{sub2_name} => #{sub2_url}"
          else
            puts "----Sub2Category \"#{sub2_name}\" already exists in db"
          end


        end #of sub2_url each

      end #of sub1_url each
      puts "***************************************************************"
    end #of cat_url each

  end
end