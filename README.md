# metaphrase
I18N as a service in the form of a Rails Application.

## Goals
Internationalization of web applications with microservice architectures can lead to disperate (and incompatible) approaches to creating new strings for different applications, as well as inconsistency in the specific way identical phrases are translated from one point of exposure to the next. It can also lead to additional cost when strings of text are accidentally translated multiple times. In addition, when when individual microservices and clients rely on local translation approaches, the task fetching, retrieving, and identifying new strings becomes redundant across multiple systems leading to increased complexity and greater liklihood of translation bugs.

Metaphrase aims to solve this problem while achieving the following:

* Creates a single source of truth for translated strings associated standardized ISO 639 and ISO 3166 codes (e.g. en, en-us)
* Retrieves individual translations based on a key (usually the original language string) and ISO 639 and ISO 3166 code
* Retrieves an entire lexicon for a specific language based on its ISO 639 and ISO 3166 code and an optional application domain
* Retrieves missing strings and provides a list of all strings in need of translation retrievable by ISO 639 and ISO 3166 code
* Provides a way to introduce new strings in a specified language
* Allows for editing of existing strings and insertion of translated values in new languages
* Synchronizes with one or more remote Metaphrase servers to allow the process of translation to take place across multiple environments (e.g. development, staging, production)

## Best Practices
Whenever possible store phrases or longer parts of copy rather than individual strings

|Do | Don't |
|---|-------|
|Store entire phrases, paragraphs, or even longer pieces of copy when possible.  e.g. "The quick dog jumps" |Don't store individual words and attempt to reassamble them.  e.g. "the" "quick" "dog" "jumps" |
|Use the default language  word or phrase as the key for the string. e.g. key: "The quick dog jumps", translation: "The quick dog jumps" |Don't make your keys less readable by making them like a variable name. e.g. key: 'dog_sentence', translation: "The quick dog jumps" |
