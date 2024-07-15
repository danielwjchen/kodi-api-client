import Foundation

public struct KodiApiClient {

    let baseUrl: String;

    public init(_ baseUrl: String) {
        self.baseUrl = baseUrl;
    }

    public func getEpisodeCollectionService() -> GenericCollectionService<EpisodeFields, EpisodeCollectionResponseResult> {
        let result = GenericCollectionService<EpisodeFields, EpisodeCollectionResponseResult>(
            self.baseUrl,
            rpcMethod: "VideoLibrary.GetEpisodes", 
            query: "EpisodeCollection",
            properties: [
                .title,
                .thumbnail,
                .playcount,
                .lastplayed,
                .dateadded,
                .episode,
                .season,
                .rating,
                .file,
                .cast,
                .showtitle,
                .tvshowid,
                .uniqueid,
                .resume,
                .firstaired,
                .fanart
            ]
        );
        return result;
    }

    public func getEpisodeDetailsService() -> GenericDetailsService<EpisodeDetailsRequestParams, EpisodeDetailsResponseResult> {
        let result = GenericDetailsService<EpisodeDetailsRequestParams, EpisodeDetailsResponseResult>(
            self.baseUrl,
            rpcMethod: "VideoLibrary.GetEpisodeDetails", 
            query: "Episode"
        )
        return result;
    }

    public func getMovieCollectionService() -> GenericCollectionService<MovieFields, MovieCollectionResponseResult> {
        let result = GenericCollectionService<MovieFields, MovieCollectionResponseResult>(
            self.baseUrl,
            rpcMethod: "VideoLibrary.GetMovies", 
            query: "MovieCollection",
            properties: [
                .title,
                .art,
                .playcount,
                .lastplayed,
                .dateadded,
                .resume,
                .rating,
                .year,
                .file,
                .genre,
                .writer,
                .director,
                .cast,
                .set,
                .studio,
                .mpaa,
                .tag,
                .fanart
            ]
        )
        return result;
    }

    public func getMovieDetailsService() -> GenericDetailsService<MovieDetailsRequestParams, MovieDetailsResponseResult> {
        let result = GenericDetailsService<MovieDetailsRequestParams, MovieDetailsResponseResult>(
            self.baseUrl,
            rpcMethod: "VideoLibrary.GetMovieDetails", 
            query: "Movie"
        )
        return result;
    }

    public func getEpisodeDetails(_ episodeId: Int)  async throws -> Response<EpisodeDetailsResponseResult> {
        let episodeDetailsService = self.getEpisodeDetailsService()
        let params = EpisodeDetailsRequestParams(
            episodeid: episodeId, 
            properties: [
                .title,
                .thumbnail,
                .playcount,
                .lastplayed,
                .dateadded,
                .episode,
                .season,
                .rating,
                .file,
                .cast,
                .showtitle,
                .tvshowid,
                .uniqueid,
                .resume,
                .firstaired,
                .fanart,
                .plot,
                .director,
                .writer,
                .runtime,
                .streamdetails
            ]
        );
        let result = try await episodeDetailsService.getDetails(params);
        return result;
    }

    public func getMovieDetails(_ movieId: Int) async throws -> Response<MovieDetailsResponseResult> {
        let movieDetailsService = self.getMovieDetailsService();
        let params: MovieDetailsRequestParams = MovieDetailsRequestParams(
            movieid: movieId,
            properties: [
                .title,
                .art,
                .playcount,
                .lastplayed,
                .dateadded,
                .resume,
                .rating,
                .year,
                .file,
                .genre,
                .writer,
                .director,
                .cast,
                .set,
                .studio,
                .mpaa,
                .tag,
                .plotoutline,
                .imdbnumber,
                .runtime,
                .streamdetails,
                .plot,
                .trailer,
                .sorttitle,
                .originaltitle,
                .country,
            ]
        );
        let result = try await movieDetailsService.getDetails(params)
        return result;
    }
}