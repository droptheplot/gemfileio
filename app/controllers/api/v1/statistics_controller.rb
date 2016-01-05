class Api::V1::StatisticsController < Api::V1::ApplicationController
  def index
    @statistics = Statistic.all

    render json: @statistics, each_serializer: StatisticSerializer
  end
end
