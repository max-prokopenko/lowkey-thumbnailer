import { NativeModules } from 'react-native';

type ThumbnailerType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Thumbnailer } = NativeModules;

export default Thumbnailer as ThumbnailerType;
