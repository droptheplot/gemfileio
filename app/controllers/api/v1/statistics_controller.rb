class Api::V1::StatisticsController < Api::V1::ApplicationController
  def index
    @statistics = Statistic.order(id: :desc)

    render json: @statistics, each_serializer: StatisticSerializer
  end
end
