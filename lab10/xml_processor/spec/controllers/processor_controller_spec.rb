# frozen-string-literal: true

require 'rails_helper'

describe ProcessorController, type: :controller do
  def submit_form(from, to, format)
    get :output, params: { from: from, to: to, format: format.to_s }
    response
  end

  it 'responds with XML when client-side XSLT is selected' do
    expect(submit_form('0', '9999', :xml).body).not_to include('<html>')
  end

  it 'responds with HTML when server-side XSLT is selected' do
    expect(submit_form('0', '9999', :html).body).to include('<html>')
  end
end
