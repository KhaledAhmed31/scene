
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:scene/core/errors/remote/remote_error_handler.dart';
import 'package:scene/features/watchlist/data/datasources/watchlist_local_data_source.dart';
import 'package:scene/features/watchlist/data/models/watchlist_model.dart';

@lazySingleton
class WatchlistDataSource {
  static DocumentReference<WatchlistModel> watchlistDocument =
      getWatchlistDocument();

  Future<WatchlistModel> removeFromWatchlist(WatchlistItemModel movie) async {
    try {
      DocumentReference<WatchlistModel> doc = getWatchlistDocument();
      await doc.update({
        "movies": FieldValue.arrayRemove([movie.toJson()]),
      });
      return await getWatchlist();
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Watchlist is empty';
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<WatchlistModel> getWatchlist() async {
    try {
      DocumentReference<WatchlistModel> doc = getWatchlistDocument();
      DocumentSnapshot<WatchlistModel> snapshot = await doc.get();
      return snapshot.data() ?? WatchlistModel(movies: []);
    } catch (e) {
      String message = e.toString();
      if (e is FirebaseException) {
        message = e.message ?? 'Connection error';
      }
      throw RemoteErrorHandler(message: message);
    }
  }

  Future<WatchlistModel> addToWatchlist(WatchlistItemModel movie) async {
   try {
      DocumentReference<WatchlistModel> doc = getWatchlistDocument();
      await doc.update({
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

  static DocumentReference<WatchlistModel> getWatchlistDocument(){
    String? userId = WatchlistLocalDataSource.getUserId();

    if (userId == null || userId.isEmpty) {
      DocumentReference<WatchlistModel> doc = getUserCollection().doc()..set(WatchlistModel(movies: []));
      WatchlistLocalDataSource.saveUserId(doc.id);
      return doc;
    }
    return getUserCollection().doc(userId);
  }

  static CollectionReference<WatchlistModel> getUserCollection() {
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .withConverter<WatchlistModel>(
            fromFirestore:
                (snapshot, _) => WatchlistModel.fromJson(snapshot.data()!),
            toFirestore: (watchlistModel, _) => watchlistModel.toJson(),
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
