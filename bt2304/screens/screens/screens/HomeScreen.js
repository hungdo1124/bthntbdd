import React from 'react';
import { View, Text, Button } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const HomeScreen = ({ route, navigation }) => {
  const { name } = route.params || {};

  const handleLogout = async () => {
    await AsyncStorage.removeItem('user');
    navigation.replace('Login');
  };

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 22 }}>Chào mừng, {name || 'người dùng'}!</Text>
      <Button title="Đăng xuất" onPress={handleLogout} />
    </View>
  );
};

export default HomeScreen;
