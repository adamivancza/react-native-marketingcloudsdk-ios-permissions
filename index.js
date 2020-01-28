
import { NativeModules } from 'react-native';

const { RNReactNativeMarketingcloudsdkIosPermissions } = NativeModules;

export default {
  askForPermission() {
    RNReactNativeMarketingcloudsdkIosPermissions.askForPermission();
  },
};
