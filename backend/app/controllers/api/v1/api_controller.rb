module Api::V1
    class ApiController < ApplicationController
      def render_error(message: nil, fields: nil, status: :unprocessable_entity)
        errors = {}
        errors['fields'] = fields if fields.present?
        errors['message'] = message if message.present?
        render_json: { errors: errors }, status: status
      end
    end
end