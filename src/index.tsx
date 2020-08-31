import { NativeModules } from 'react-native';

type ThumbnailerType = {
  getThumbnail(originalVideoUrl: string, callback: Function): any;
};

const { Thumbnailer } = NativeModules;

export default Thumbnailer as ThumbnailerType;
