# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for
    new_my_csv_path
  end
end
