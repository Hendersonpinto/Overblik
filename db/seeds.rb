class String
    # colorization
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m"
    end
  
    def green
      colorize(32)
    end
  end
  
  # #Cleaning database
  # puts "Destroying license usages..."
  # LicenseUsage.destroy_all
  
  # puts "Destroying license transactions..."
  # LicenseTransaction.destroy_all
  
  # puts "Destroying company licenses..."
  # CompanyLicense.destroy_all
  
  # puts "Destroying licenses..."
  # License.destroy_all
  
  puts "Destroying categories..."
  Category.destroy_all
  
  puts "Destroying vendors..."
  Vendor.destroy_all
  
  puts "Destroying vendor contacts..."
  VendorContact.destroy_all
  
  puts "Destroying users..."
  User.destroy_all
  
  puts "Destroying companies..."
  Company.destroy_all
  
  puts "Destroying departments..."
  Department.destroy_all
  


  #Creating entries





  puts "\nCreating vendors by categories..."
  categories = [
    {name: "Sales",
     companies:("Salesforce, SalesForce, Hubspot, Pipedrive, 
      Yesware, Outreach, Gong, SalesLoft, Chorus, 
      DocSend, InsightSquared, Boomerang for Gmail, 
      PurerB2B, Lusha, Zoho, Xactly, Close, Base, Leadiq, 
      DiscoverOrg, PersistIQ, Copper, Linkedin Sales, 
      Navigator, Growbots, LeanData, Conga, Highspot, 
      Salesforce, PureB2B, InsightSquared, Dialpad, Clari, 
      Cirrus Insight, MapAnything, LeadiQ, Connect leader").split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "Customer Support",
    companies: ("Atlassian, Zendesk, Intercom, Help Scout, Front, 
      Teamwork, Hiver, Five9, Gainsight, Uservoice, Fuze, Gorgias, 
      Vitally, Ask Nicely, Helpjuice, Freshdesk, Clientsuccess, 
      Salesmachine, Chatlio, Wootric, Atlassian, Kustomer, Solvvy, 
      Truly, Qualtrics, Churnzero, Agiloft, Helpshift").split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "Engineering",
    companies: ("GitHub, IntelliJ Idea, SendGrid, Circleci, Pingdom, 
      New Relic, BrowserStack, Ngrok, Npm, Docker, Bitbucket, Papertrail, 
      Rollbar, Twilio, Travis CI, Postman, Stitch, PivotalTracker, 
      JetBrains, Clubhouse, GitHub, Gitlab, IntelliJ IDEA, Code Climate, 
      Replicated, PubNub, Pusher, JFrog, ClubHouse, Retool").split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "Marketing",
    companies: ("Mailchimp, Semrush, Canva, Mixmax, Clearbit, Wistia, 
      Marketo, Screamingfrog, Mom, Sproutsocial, Litmus, Unbounce, 
      Shutterstock, Drift, Hubspot, Wufoo, Cloudinary, Hootsuite, 
      Meltwater, Customer.io, Capterra, HL HipLead, Sendoso, Vantiv, 
      Intent Media, Klaviyo, Lob, Gartner, Zoominfo, BuySellAds, Linkedin Marketing Solutions, Braze").split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "Dev Ops",
    companies:("PagerDuty, Sentry, Namecheap, WP Engine, Datadog, 
      DigitalOcean, Cloudflare, Bugsnag, Statuspage, Linode, Gemfury, 
      Elastic, mLab, DNS Made Easy, Sumo Logic, Fastly, Redislab, 
      Buildkite, Contentful, Logdna, Sumo logic, PagerDuty, MongoDB, 
      Aptible, Snowflake, Softlayer, Threat stack, Convox").split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "Product",
    companies: "Typeform, Adobe Creative Cloud, Sketch, Zeplin, Fullstory, 
    Webflow, Dribble, Figma, Abstract, Noun Project, Invision, Algolia, 
    Appcues, Fonts.com, Productboard, Hotjar, Mural, Azure, Lookback, Rev, 
    Authenticom, Alfresco, Typeform, Onshape, Solidworks, Metamarkets, 
    Split, Barchart, Appsflyer, Delighted, Materialise".split(/\s*,\s*/).in_groups_of(1, false) 
    },
    {name: "IT & Security",
    companies: "Parallels, Solarwinds, Knowbe4, Fleetsmith, LogMeIn, 
    Keeper, Mover, Jamf, Code42, Rapid1, Sequr, Cloudcraft, Cobalt, 
    Exostar, Splunk, ScaleGrid, CloudHQ, Fortrabbit, Detectify, 
    SimpliSafe, KnowBe4, Databricks, CloudHealth, Synopsys, ThreatMetrix, 
    Parallels, LexisNexis, Crowdstrike, Cleo, TrendMicro, Rapid7, Area1".split(/\s*,\s*/).in_groups_of(1, false) 
  },
    {name: "Human Resources",
    companies: "LinkedIn, Gusto, BambooHR, Lever, Upwork, CoderPad, 
    Greenhouse, Lattice, Checkr, Pingboard, Treehouse, Workable, 
    Breezy, TaskRabbit, Fiverr, Glassdoor, Culture Amp, Goodhire, 
    AngelList, Indeed, ADP, Namely, Linkedin, Justworks, Freshworks, 
    Twine, Engagedly, Cornerstone, Paylocity, Zenefits".split(/\s*,\s*/).in_groups_of(1, false) 
  },
    {name: "Finance",
    companies: "Bill.com, Avalara, Expensify, Quickbooks, Recurly, 
    Intuit, Xero, Paypal, Baremetrics, ProfitWell, ChartMogul, 
    Sift Science, Chargify, Track 1099, Financialforce, Oracle, 
    Botkeeper, Altium, Adaptive Insights, TransferWise, Bill.com, 
    SAP Concur, Braintree, Zuora, PayPal, Financeforce, Prophix, 
    Sage Intacct, CoreLogic, Infor".split(/\s*,\s*/).in_groups_of(1, false) 
  },
  ]


  categories.each do |category|
    Category.where(name: category[:name]).first_or_create!
    category[:companies].each do |vendor|
      new_vendor = Vendor.find_by("LOWER(name) = ?", vendor[0].downcase) || Vendor.create!(name:vendor[0], category:category[:name])
    end
  end



  puts "Created #{Vendor.all.count} vendors from #{Category.all.count} categories"
  
  
  
  
  
  
  

  
  
  
  
  


  puts "\nCreating companies..."
  companies = [
    {name: "Overblik", website:"www.overblik.io", country: "Denmark", city: "Copenhagen", address:"Ahornsgade 15" },
  ]
  
  companies.each do |company|
      Company.create!(company)
    end
    puts "Created #{Company.all.count} companies"
    
    puts "Creating departments"
      departments =["Sales"]
      departments.each do |department|
        Department.create!(name:department)
      end
    puts "Finishing creating departments"
  
  puts "Creating system accounts"

  SystemAccount.create(stripe_account: "strip try1")
  SystemAccount.create(stripe_account: "strip try2")
  SystemAccount.create(stripe_account: "strip try3")
  SystemAccount.create(stripe_account: "strip try4")
  SystemAccount.create(stripe_account: "strip try5")


  puts "\nCreating users..."
  p "COMPANYYYYYYYYYYYYYYYYYYYYYYYYYYYYY #{Company.first}"
    users = [
      {first_name: "Susan", last_name: "Ferguson", email: "susan@company.com", password: "123456", department: Department.first, company: Company.first, company_name: Company.first.name, system_account: SystemAccount.first },
      {first_name: "Peter", last_name: "Albridge", email: "peter@company.com", password: "123456", department: Department.first, company: Company.first, company_name: Company.first.name, system_account: SystemAccount.all[1] },
      {first_name: "Mike", last_name: "Peterson", email: "mike@company.com", password: "123456", department: Department.first, company: Company.first, company_name: Company.first.name, system_account: SystemAccount.all[2] },
      {first_name: "Carol", last_name: "Anderson", email: "carol@company.com", password: "123456", department: Department.first, company: Company.first, company_name: Company.first.name, system_account: SystemAccount.all[3] },
      {first_name: "Kathrine", last_name: "Hudson", email: "kathrine@company.com", password: "123456", department: Department.first, company: Company.first, company_name: Company.first.name, system_account: SystemAccount.all[4] },
    ]
  
    users.each do |user|
      User.create!(user)
    end
  puts "Finished creating users"
  

  