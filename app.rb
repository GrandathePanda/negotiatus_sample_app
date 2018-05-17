require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/namespace'
require 'sinatra/reloader'
require 'sinatra/json'
require 'json'
require 'date'


class Shipment < ActiveRecord::Base
    belongs_to :vendor
end

class Vendor < ActiveRecord::Base
    has_many :shipments
end
class App < Sinatra::Base
    register Sinatra::Namespace
    set :database_file, 'config/database.yml'
    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        File.read(File.join('public', 'index.html'))
    end
    namespace '/api/shipments' do
        get '' do
            json items: Shipment.limit(100).order(:ordered_at)
        end
        get '/late' do
            shipments = Shipment.joins(:vendor)
                .where('vendors.average_delivery_time < (now()::date - shipments.ordered_at) AND shipments.delivered = False')
                .select('vendors.name, vendors.average_delivery_time, shipments.ordered_at, shipments.order_number, shipments.address, ((now()::date - shipments.ordered_at) - vendors.average_delivery_time) AS late_by')
                .limit(100)
            json items: shipments
        end
        get '/undelivered' do
            shipments = Shipment.where(delivered: false).limit(100)
            json items: shipments
        end
        get '/:vendor' do
            shipments = Shipment.joins(:vendor)
                                 .where('vendors.name' => params[:vendor])
                                 .limit(100)
            json items: shipments
        end
        post '/new' do
            request.body.rewind
            body = JSON.parse request.body.read
            vendor = body.fetch('vendor', nil)
            if vendor.nil?
                json success: false
            else
                vendor = Vendor.where(name: vendor)
                    .first_or_create(:name => vendor)
                shipment = Shipment.new(
                       order_number: body['order_number'],
                       vendor_id: vendor.id,
                       tracking_identifier: body['tracking_identifier'] || nil,
                       address: body['address'],
                       ordered_at: DateTime.now
                    )
                if shipment.save
                    json success: true
                else
                    json success: false
                end
            end
        end
    end

    not_found do
        404
    end
end
