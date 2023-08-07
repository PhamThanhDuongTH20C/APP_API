<!--
Created: Thu May 28 2020 12:00:55 GMT+0900 (日本標準時)
Modified: Thu JAN 10 2023 16:49:17 GMT+0900 (日本標準時)
-->

# Training manual

&copy; 2023 RiverCrane Corp.

Estimated time: ~ 2 weeks for all 5 test levels (without knowing Dart or Flutter).

---

## Know How

Throughout the course of doing training tests, members need to learn the [Dart programming language](https://dart.dev/guides) and [Flutter](https://flutter.dev/docs).

In addition, members should also learn server-side programming using [Laravel](https://laravel.com/).

**Useful URLs:**

* [Flutter Tutorial](https://flutter.dev/docs/reference/tutorials)
* [Flutter in Practice](https://www.youtube.com/playlist?list=PLhXZp00uXBk5TSY6YOdmpzp1yG3QbFvrN)
* [Flutter Widget catalog](https://flutter.dev/docs/development/ui/widgets)
* [Laravel JSON response](https://laravel.com/docs/master/responses)

## Test levels

The tests only reflect part of the programming skills that members need to achieve for the actual project.

All code **must pass all coding standards** before it can be committed.

For Flutter:

```bash
cd ~/Training/mobile_app/
flutter analyze
```

For API:

```bash
cd ~/Training/server/laradock
docker-compose exec workspace bash -c "cd /var/www/;bash fixer"
```

---

### Test 1: Basic UI

Use Flutter to create a list of items. Each item contains an image, a title, a description text, created date and item price.

**References:**

* [Displaying Messages with ListView](https://www.youtube.com/watch?v=TEIhOnlMudM) (you may skip to 3:25)

**Goal:**

* Basic: The description text of the item displays up to 2 lines.
  * Show ellipsis (...) if the text is longer than 2 lines.
  * If the text is shorter than one line, only one line is displayed.
* Advanced: font size should change according to the default font size settings of the operating system (both on iOS and Android).

---

### Test 2: Navigate between screens

Create a new screen for displaying the detailed content of the items in Test 1.

**References:**

* [Navigating between Screens](https://zaiste.net/programming/flutter/howtos/navigate-between-screens-flutter/)

**Goal:**

* Basic:
  * When clicking on any item on the list screen, navigate to the details screen.
  * When you press the Back button in the title bar of the details screen, navigate back to the list screen.
* Advanced:
  * For iOS, the side swipe gesture can be used to navigate back to the list screen from the details screen.
  * For Android, the Back button of the navigation bar can be used to navigate back to the list screen from the details screen.

---

### Test 3: Interact with API server

**References:**

* [Types & JSON Serialization](https://www.youtube.com/watch?v=rniuCsmxCsI)
* [Automatic JSON Serialization](https://www.youtube.com/watch?v=NkUtwePWhZo)
* [HTTP Request & Response](https://www.youtube.com/watch?v=WsgsP-AKxFo)

**Goal:**

Write code to fetch data from remote RestAPI (usually in JSON format).

|  API URL | https://news.webike.net/wp-json/wp/v2/posts |
| --- | --- |
|  API Document | https://developer.wordpress.org/rest-api/reference/posts/ |
|  Parameters | - per_page (default: 15)<br/>- page (default: 1)<br/>- orderby (default: date)<br/>- order (default: desc)<br/>- status = publish |
|  Fields to display in list | - title.rendered<br/>- excerpt.rendered<br/>- modified_gmt<br/>- Fetch photo from _links.wp:featuredmedia, size "medium" |
|  Fields to display in detail | - title.rendered<br/>- content.rendered<br/>- modified_gmt<br/>- Fetch photo from _links.wp:featuredmedia, size "full" |

* Basic:
  * Define a `Post` class follow above API response (must include required colums).
  * Write a `PostService` class with a static method `getPosts` to retrieve a list of `Post` objects from API, parameters can be adjustable.
  * Handle HTTP exceptions and JSON parser's exceptions.
  * Handle API timeout (10 seconds) for bad network condition.
* Advanced:
  * Only fetch photo data from `_links.wp:featuredmedia` when needed to reduce API requests (using getter and Future technique).

---

### Test 4: Load and display data from API

Display result from Test 3 in List page (Test 1) and Details page (Test 2).

|  API URL | https://news.webike.net/wp-json/wp/v2/posts |
| --- | --- |
|  API Document | https://developer.wordpress.org/rest-api/reference/posts/ |
|  Parameters | - per_page (default: 15)<br/>- page (default: 1)<br/>- orderby (default: date)<br/>- order (default: desc)<br/>- status = publish |
|  Fields to display in list | - title.rendered<br/>- excerpt.rendered<br/>- modified_gmt<br/>- Fetch photo from _links.wp:featuredmedia, size "medium" |
|  Fields to display in detail | - title.rendered<br/>- content.rendered<br/>- modified_gmt<br/>- Fetch photo from _links.wp:featuredmedia, size "full" |

**References:**

* [Async / Await & FutureBuilder](https://www.youtube.com/watch?v=_60WdOoezmc)
* [Streams + Futures for HTTP](https://www.youtube.com/watch?v=T9aYTkF53X0)

**Goal:**

* Basic:
  * Show loading indicator when receiving data.
  * Show "No data" when there is no data from API.
  * Show "Retry" button when there is an error (exceptions etc.).
  * Content in List page should be displayed in plain text.
  * Content in Details page should be displayed in HTML.
* Advanced:
  * Handle pagination in List page (E.g: Click "Load more" button to load the next page).
  * Tap on photo (if presented) in Details page will open Photo Viewer with media description in media API.

---

### Test 5: Manage widget states

**References:**

* [Streams, StreamBuilder & BLoC](https://www.youtube.com/watch?v=PRd4Y_E2od4)
* [More Manager BLoCs & Streams](https://www.youtube.com/watch?v=JChxsAdWsRQ)

**Goal:**

* Basic:
  * Add the bookmark icon into item of news list.
  * Add the bookmark icon into news Detail Screen.
  * Press to change state of the icon for 2 cases.
* Advanced:
  * Change the state of the bookmark icon in the Details Screen and update it for that news in list of the Home Screen as well.  (Using BLoC for update state)

---

* [Home](../readme.md#)
* [Setup Tools](./setup.md#)
* [Prepare for training](./prepare.md#)
* [Training manual](./test-manual.md#)

---

This project is only accessible within RiverCrane Corp.


&copy; 2023 RiverCrane Corp.
