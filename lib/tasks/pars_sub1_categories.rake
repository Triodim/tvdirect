require 'mechanize'

namespace :utils do
  desc "Pars sub1 categories structure and save it to db"
  task(:pars_sub1_categories => :environment) do


    agent = Mechanize.new()

    begin
    page = agent.get("https://www.tvdirect.tv/health?___from_store=th&___store=en")
    rescue Mechanize::RedirectLimitReachedError => error
      puts "The main page is not available for parsing" + error.message
      i += 1
      next
    end

    sub1_url_list = page.search("//a[starts-with(@class, 'level1')]/@href").to_a   #find all subcategories's urls

    url_name = {}

    Category.all.each do |cat|

      sub1_url_list.each do |url|

        #puts "Check #{cat.url} in #{url} "
        #puts url.to_s.include?(cat.url.to_s)

          if url.to_s.include?(cat.url.to_s)

            #puts "#{cat.url} is in  => + #{url}"

            name = page.search("//a[@href='#{url.to_s}'][starts-with(@class, 'level1')]").text
            url_name[name] = url.to_s
            categories = Sub1Category.find_by(name: name)

            if !categories
              category = cat.sub1_categories.build(:name=>name,
                                      :url=>url_name[name],
                                      :category_id=>cat.id
                                      )
              category.save
              puts "#{name} sub1 category doesn't exist, saved to db #{name} => #{url_name}"
            else
              puts "#{name} already exists in db"
            end

          end
      end
        puts "---------------------------------"
    end
  end
end