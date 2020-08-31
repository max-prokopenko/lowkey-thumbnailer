import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import Thumbnailer from '@lowkey/thumbnailer';

export default function App() {
  const [uri, setUri] = React.useState<string | undefined>();
  const [size, setSize] = React.useState<number | undefined>();

  React.useEffect(() => {
    Thumbnailer.getThumbnail("https://api.lowkeychat.com/messages/media/5144c6c6-8a39-4a55-8a5c-5a9ff471638e", (error: any, data: { uri: React.SetStateAction<string | undefined>; size: React.SetStateAction<number | undefined>; }) => {
      if(error) {
        console.log(error);
        return;
      }
      setUri(data.uri);
      setSize(data.size);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>URI: {uri}</Text>
      <Text>Size: {size}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
