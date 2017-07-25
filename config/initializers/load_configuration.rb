require 'erb'

SALESFORCE = YAML.load(ERB.new(File.read(Rails.root.join("config","salesforce.yml").to_path)).result)[Rails.env]
