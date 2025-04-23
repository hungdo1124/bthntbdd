import React, { useState } from 'react';
import { View, Text, TextInput, Button, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    if (!email || !password) {
      Alert.alert('Vui lòng nhập email và mật khẩu!');
      return;
    }

    try {
      const storedUser = await AsyncStorage.getItem('user');
      const parsedUser = JSON.parse(storedUser);

      if (parsedUser && parsedUser.email === email && parsedUser.password === password) {
        Alert.alert('Đăng nhập thành công!');
        navigation.navigate('Home', { name: parsedUser.name });
      } else {
        Alert.alert('Sai email hoặc mật khẩu!');
      }
    } catch (error) {
      Alert.alert('Lỗi:', error.message);
    }
  };

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 24, marginBottom: 20 }}>Đăng nhập</Text>
      <TextInput placeholder="Email" value={email} onChangeText={setEmail} keyboardType="email-address" style={styles.input} />
      <TextInput placeholder="Mật khẩu" value={password} onChangeText={setPassword} secureTextEntry style={styles.input} />
      <Button title="Đăng nhập" onPress={handleLogin} />
      <Text style={{ marginTop: 20 }} onPress={() => navigation.navigate('Register')}>Chưa có tài khoản? Đăng ký</Text>
    </View>
  );
};

const styles = {
  input: { borderWidth: 1, borderColor: '#ccc', padding: 10, marginBottom: 10, borderRadius: 5 },
};

export default LoginScreen;
