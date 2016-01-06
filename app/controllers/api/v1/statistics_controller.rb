class Api::V1::StatisticsController < Api::V1::ApplicationController
  def index
    @statistics = Statistic.order(created_at: :asc).limit(30)

    render json: @statistics, each_serializer: StatisticSerializer
  end
end
