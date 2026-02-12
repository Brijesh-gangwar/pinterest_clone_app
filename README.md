# pinterest_clone_app

A Flutter Pinterest-style clone app

## Introduction

This repository contains a small Flutter app that demonstrates a Pinterest-like
image feed with staggered grid layout, caching, and simple local persistence.


## Packages Used


- **clerk_flutter**: User authentication and session management.
- **go_router**: Routing and navigation.
- **flutter_riverpod**: Lightweight Flutter state management library.
- **flutter_staggered_grid_view**: Staggered / masonry grid layouts for the feed.
- **cached_network_image**: Image downloading with caching and placeholders.
- **shimmer**: Shimmering loading placeholders while images load.
- **shared_preferences**: Simple key/value storage for small preferences.
- **hive** and **hive_flutter**: Lightweight local NoSQL storage for caching or persistence.


Dev dependencies:

- **flutter_lints**: Static analysis rules.
- **hive_generator** and **build_runner**: Code generation for Hive adapters.

## Folder Structure

```
lib/
	main.dart
	router.dart
	core/
		constants/
		helper/
	domain/
		models/
		repositories/
		services/
        notifiers/
	presentation/
		screens/
		widgets/

```

## Features

- Pinterest-style staggered image grid feed.
- Cached network images with placeholders and shimmer effects.
- User authentication using `clerk_flutter`.
- Navigation with `go_router`.
- Local persistence and caching using `hive` and lightweight settings via `shared_preferences`.
- Build-time Hive adapter generation using `hive_generator` + `build_runner`.
