import React, { useState } from 'react';
import { View, Text, TextInput, Button, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const RegisterScreen = ({ navigation }) => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleRegister = async () => {
    if (!name || !email || !password) {
      Alert.alert('Vui lòng nhập đầy đủ thông tin!');
      return;
    }

    try {
      const user = { name, email, password };
      await AsyncStorage.setItem('user', JSON.stringify(user));
      Alert.alert('Đăng ký thành công!');
      navigation.navigate('Login');
    } catch (error) {
      Alert.alert('Lỗi:', error.message);
    }
  };

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 24, marginBottom: 20 }}>Đăng ký</Text>
      <TextInput placeholder="Tên" value={name} onChangeText={setName} style={styles.input} />
      <TextInput placeholder="Email" value={email} onChangeText={setEmail} keyboardType="email-address" style={styles.input} />
      <TextInput placeholder="Mật khẩu" value={password} onChangeText={setPassword} secureTextEntry style={styles.input} />
      <Button title="Đăng ký" onPress={handleRegister} />
      <Text style={{ marginTop: 20 }} onPress={() => navigation.navigate('Login')}>Đã có tài khoản? Đăng nhập</Text>
    </View>
  );
};

const styles = {
  input: { borderWidth: 1, borderColor: '#ccc', padding: 10, marginBottom: 10, borderRadius: 5 },
};

export default RegisterScreen;
