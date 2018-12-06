class Api::ConfigurationController < ApplicationController

  def setting
    json = Setting.last.as_json
    return render json: [] if json.nil?
    render json: json
  end

  def modify
    set = Setting.last
    set.nil? ? create_setting : update_setting(set)
  end

  private

  def create_setting
    Setting.create(setting_params)
    render json: { message: 'Configuração editada com sucesso.' }
  end

  def update_setting(set)
    set.update(setting_params)
    render json: { message: 'Configuração editada com sucesso.' }
  end

  def setting_params
    params.permit(:readjust, :duration)
  end
end
