module Api::V1
    class OperationsController < ApplicationController
        before_action :set_operation_attributes, only: [:create]

        def index
            @operations = Operation.all
            render :json => { operations: @operations }  
        end

        def create
            byebug
            @set_operation_attributes.each do |operation_atribute|
                @operation = Operation.new
                @operation.attributes = operation_attribute
                @operation.save!
            rescue
                render_error(fields: @operation.errors.messages)
            end
        end

        private

        def set_operation_attributes
            @operation_attributes = Cnab::PArse.new(params[:cnab_file]).to_atrributes
        end

        def formatted_operation
            @operations = @operations.map do |operation|
                OperationPresenter.new(operation).as_json
            end
        end
    end
end
