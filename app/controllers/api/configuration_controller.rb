class Api::ConfigurationController < ApplicationController

  def setting
    json = Setting.last.as_json
    return render json: [] if json.nil?
    render json: json
  end

  def modify
    setting = Setting.last
    if setting.update(setting_params)
      render json: { message: 'Compromisso editado com sucesso.' }
    else
      render json: { message: 'Compromisso não pode ser editado.' }
    end
  end

  private

  def setting_params
    params.permit(:readjust, :duration)
  end
end
