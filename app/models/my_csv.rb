# frozen_string_literal: true

require 'csv'
require 'securerandom'


class MyCsv < ApplicationRecord
  include WebhookApi
  belongs_to :user
  has_many :books, dependent: :destroy
  after_create :set_filename, :send_request, :send_csv

  after_create_commit :create_books
  has_one_attached :file

  private

  def set_filename
    if file.attached?
      file.blob
          .update(filename: "#{file.filename.base}-#{SecureRandom.uuid}.#{file.filename.extension}")
    end
  end

  def create_books
    CSV.parse(file.download, headers: true).each do |row|
      books.create(row.to_hash)
    end
  end

  def send_csv
    send_csv_request(file.filename)
  end
end
