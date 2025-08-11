import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/core/movies/entity/common_response_entity.dart';
import 'package:scene/features/watchlist/data/datasources/watchlist_local_data_source.dart';
import 'package:scene/features/watchlist/data/models/watchlist_model.dart';

@lazySingleton
class WatchlistDataSource {
  static DocumentReference<List<WatchlistItemModel>> watchlistDocument =
      getWatchlistDocument();


  Future<List<WatchlistItemModel>> removeFromWatchlist(CommonItemEntity movie) async {
    String? userId = WatchlistLocalDataSource.getUserId();

    try {
      DocumentReference<List<WatchlistItemModel>> doc = getUserCollection().doc(
        userId,
      );
      await doc.update({"movies": FieldValue.arrayRemove([movie.toJson()])});
      return await getWatchlist();
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Watchlist is empty';
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<List<WatchlistItemModel>> getWatchlist() async {
    String? userId = WatchlistLocalDataSource.getUserId();

    try {
      DocumentReference<List<WatchlistItemModel>> doc = getUserCollection().doc(
        userId
      );
      return await doc.get().then((value) => value.data()!);
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Connection error';
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<List<WatchlistItemModel>> addToWatchlist(
    CommonItemEntity movie,
  ) async {
    try {
      await watchlistDocument.update({
        "movies": FieldValue.arrayUnion([movie.toJson()]),
      });
      return await getWatchlist();
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Could not add to watchlist';
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  static DocumentReference<List<WatchlistItemModel>> getWatchlistDocument() {
    String? userId = WatchlistLocalDataSource.getUserId();

    if (userId == null || userId.isEmpty) {
      DocumentReference<List<WatchlistItemModel>> doc =
          getUserCollection().doc();
      WatchlistLocalDataSource.saveUserId(doc.id);
      return doc;
    }
    return getUserCollection().doc(userId);
  }

  static CollectionReference<List<WatchlistItemModel>> getUserCollection() {
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .withConverter(
            fromFirestore:
                (snapshot, options) =>
                    snapshot
                        .data()!["movies"]
                        .map((e) => WatchlistItemModel.fromJson(e))
                        .toList(),
            toFirestore:
                (value, options) => {
                  'movies': value.map((e) => e.toJson()).toList(),
                },
          );
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Connection error';
      }
      throw RemoteErrorHandler(message: message);
    }
  }
}
