module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module RequestHelpers
    def options(*args)
      reset! unless integration_session
      integration_session.__send__(:process, :options, *args).tap do
        copy_session_variables!
      end
    end
  end
end
