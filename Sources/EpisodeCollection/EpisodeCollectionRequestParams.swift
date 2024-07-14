struct EpisodeCollectionRequestParams: RequestParams {
    var properties: [EpisodeFields];
    var limits: RequestLimits;
    var sort: RequestSort;
    var filter: RequestFilter?;
}