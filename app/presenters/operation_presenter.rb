class OperationPresenter
    attr_accessor :operation
    delegate :categorycode ,:occurrencetime, :value, to: :operation
    
    def initialize(operation)
        @operation = operation
    end

    def as_json
    {
        category_type: categorycode,
        date: occurrencetime.strftime("%d/%m/%Y"),
        value: sprintf('%.2f', value),
        individualregistration: operation.recipient.individualregistration,
        card: operation.recipient.card,
        hour: occurrencetime.strftime("%H:%M:%S"),
        storename: operation.store.storeowner,
        storeowner: operation.store.storename
    }
    end
end