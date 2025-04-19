import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Picker } from '@react-native-picker/picker';

const Stack = createNativeStackNavigator();

const SignUpScreen = ({ navigation }) => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSignUp = async () => {
    if (username && email && password) {
      const user = { username, email, password };
      await AsyncStorage.setItem('user', JSON.stringify(user));
      Alert.alert('Thành công', 'Đăng ký thành công!');
      navigation.navigate('Login');
    } else {
      Alert.alert('Lỗi', 'Vui lòng nhập đầy đủ thông tin!');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Đăng ký</Text>
      <TextInput style={styles.input} placeholder="Tên người dùng" onChangeText={setUsername} />
      <TextInput style={styles.input} placeholder="Email" keyboardType="email-address" onChangeText={setEmail} />
      <TextInput style={styles.input} placeholder="Mật khẩu" secureTextEntry onChangeText={setPassword} />
      <Button title="Đăng ký" onPress={handleSignUp} />
      <Text style={styles.link} onPress={() => navigation.navigate('Login')}>Đã có tài khoản? Đăng nhập</Text>
    </View>
  );
};

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    const userData = await AsyncStorage.getItem('user');
    const user = JSON.parse(userData);
    if (user && user.email === email && user.password === password) {
      Alert.alert('Đăng nhập thành công!');
      navigation.navigate('Location');
    } else {
      Alert.alert('Sai thông tin đăng nhập');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Đăng nhập</Text>
      <TextInput style={styles.input} placeholder="Email" onChangeText={setEmail} />
      <TextInput style={styles.input} placeholder="Mật khẩu" secureTextEntry onChangeText={setPassword} />
      <Button title="Đăng nhập" onPress={handleLogin} />
      <Text style={styles.link} onPress={() => navigation.navigate('SignUp')}>Chưa có tài khoản? Đăng ký</Text>
    </View>
  );
};

const LocationScreen = ({ navigation }) => {
  const [zone, setZone] = useState('Banani');
  const [area, setArea] = useState('Area 1');

  const handleSaveLocation = async () => {
    await AsyncStorage.setItem('location', JSON.stringify({ zone, area }));
    navigation.navigate('Home');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Chọn vị trí của bạn</Text>
      <Text>Zone:</Text>
      <Picker selectedValue={zone} onValueChange={(value) => setZone(value)}>
        <Picker.Item label="Banani" value="Banani" />
        <Picker.Item label="Gulshan" value="Gulshan" />
      </Picker>
      <Text>Area:</Text>
      <Picker selectedValue={area} onValueChange={(value) => setArea(value)}>
        <Picker.Item label="Area 1" value="Area 1" />
        <Picker.Item label="Area 2" value="Area 2" />
      </Picker>
      <Button title="Lưu & Tiếp tục" onPress={handleSaveLocation} />
    </View>
  );
};

const HomeScreen = () => {
  const [user, setUser] = useState(null);
  const [location, setLocation] = useState(null);

  React.useEffect(() => {
    const loadData = async () => {
      const u = await AsyncStorage.getItem('user');
      const l = await AsyncStorage.getItem('location');
      setUser(JSON.parse(u));
      setLocation(JSON.parse(l));
    };
    loadData();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Chào mừng {user?.username}!</Text>
      <Text>Khu vực: {location?.zone} - {location?.area}</Text>
    </View>
  );
};

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="SignUp" screenOptions={{ headerShown: false }}>
        <Stack.Screen name="SignUp" component={SignUpScreen} />
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Location" component={LocationScreen} />
        <Stack.Screen name="Home" component={HomeScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: 'center' },
  title: { fontSize: 24, fontWeight: 'bold', textAlign: 'center', marginBottom: 20 },
  input: { borderBottomWidth: 1, marginBottom: 15, paddingVertical: 8 },
  link: { marginTop: 10, color: 'blue', textAlign: 'center' },
});
