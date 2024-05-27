# riverpod_sample

A new riverpod with clean architecture sample project.

## Getting Started

### 1-Domain Layer:
Entities: Post class represents the post data.

Repositories: Abstract PostRepository defines methods for fetching and saving posts.

Use Cases: PostsUsecase implement the business logic for fetching and saving posts respectively.

### 2-Data Layer:
Models: PostModel extends Post and adds methods for JSON and SQLite conversion.

Data Sources: PostRemoteDataSourceImpl fetches data from an API, while PostLocalDataSourceImpl interacts with SQLite.

Repositories: PostRepositoryImpl implements PostRepository and handles data fetching from remote and local sources.

### 3-Presentation Layer:
Providers: Riverpod providers manage the state of the application.

Views: PostListView is a UI widget that displays the list of posts.
