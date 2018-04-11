require 'mechanize'


namespace :utils do
  desc "Pars sub2 categories structure and save it to db"
  task(:pars_sub2_categories => :environment) do


    agent = Mechanize.new()

    page = agent.get("https://www.tvdirect.tv/health?___from_store=th&___store=en")

    sub2_url_list = page.search("//a[starts-with(@class, 'level2')]/@href").to_a   #find all sub2categories's urls

    url_name = {}

    Sub1Category.all.each do |sub1|

      sub2_url_list.each do |url|

        if url.to_s.include?(sub1.url.to_s)

          name = page.search("//a[@href='#{url.to_s}'][starts-with(@class, 'level2')]").text
          url_name[name] = url.to_s
          sub2_cat = Sub2Category.find_by(name: name)

          if !sub2_cat
            category = sub1.sub2_category.build(:name=>name,
                                    :url=>url_name[name],
                                    :sub1_category_id=>sub1.id
                                    )
            category.save
            puts "#{name} sub2 category doesn't exist, saved to db #{name} => #{url_name}"
          else
            puts "#{name} already exists in db"
          end

        end
      end
        puts "---------------------------------"
    end
  end
end