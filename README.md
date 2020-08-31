# @lowkey/thumbnailer

React Native module to create a thumbnail for video (iOS only)

## Installation

```sh
npm install @lowkey/thumbnailer
cd ios && pod install
```

## Usage

```js
import Thumbnailer from "@lowkey/thumbnailer";

// ...

const result = Thumbnailer.getThumbnail("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4", (error, data) => {
    console.log('URI:', data.uri);
    console.log('SIZE:', data.size);
});
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
