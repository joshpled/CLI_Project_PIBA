### listing all dependencies

require "pry"
require "httparty"
require "json"
require 'artii'
require "uri"
require "net/http"
require 'dotenv'
Dotenv.load



require_relative "./manager/cli"
require_relative "./manager/api"
require_relative "./manager/dog"
require_relative "./manager/fosters"
require_relative "./manager/staff"
require_relative "./manager/search"


