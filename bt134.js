// Cấu trúc cơ bản cho các màn hình trong Restaurant App
// src/screens/HomeScreen.js
import React from 'react';
import { View, Text, Image, ScrollView, TextInput } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const HomeScreen = () => {
  return (
    <ScrollView className="p-4 bg-white">
      <View className="flex-row items-center justify-between">
        <View className="flex-row items-center">
          <Image source={{ uri: 'https://placehold.co/50x50' }} className="w-10 h-10 rounded-full" />
          <View className="ml-2">
            <Text className="text-xs text-gray-500">Your Location</Text>
            <Text className="font-bold">Savar, Dhaka</Text>
          </View>
        </View>
        <Ionicons name="notifications-outline" size={24} color="black" />
      </View>

      <View className="my-4">
        <TextInput className="bg-indigo-100 p-3 rounded-full" placeholder="Search your food" />
      </View>

      {/* Tabs and Categories */}
      <View className="flex-row justify-between mb-4">
        <Text className="text-center text-xs">PIZZA</Text>
        <Text className="text-center text-xs">BURGER</Text>
        <Text className="text-center text-xs">DRINK</Text>
        <Text className="text-center text-xs">RICE</Text>
      </View>

      {/* Popular Item Section */}
      <Text className="text-lg font-bold mb-2">Popular Items</Text>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        <Image source={{ uri: 'https://placehold.co/150x100' }} className="mr-4 rounded-lg w-36 h-24" />
        <Image source={{ uri: 'https://placehold.co/150x100' }} className="mr-4 rounded-lg w-36 h-24" />
      </ScrollView>
    </ScrollView>
  );
};

export default HomeScreen;


// src/screens/CartScreen.js
import React, { useEffect, useState } from 'react';
import { View, Text, Image, TouchableOpacity, ScrollView } from 'react-native';
import { getCart, saveCart } from '../storage/cartStorage';

const CartScreen = () => {
  const [cart, setCart] = useState([]);

  useEffect(() => {
    getCart().then(setCart);
  }, []);

  const total = cart.reduce((acc, item) => acc + item.price * item.qty, 0);

  return (
    <ScrollView className="p-4 bg-white">
      {cart.map((item, index) => (
        <View key={index} className="flex-row items-center mb-4">
          <Image source={{ uri: item.image }} className="w-16 h-16 rounded" />
          <View className="ml-4">
            <Text className="font-bold">{item.name}</Text>
            <Text>${item.price} x {item.qty}</Text>
          </View>
        </View>
      ))}

      <View className="mt-4">
        <Text className="text-lg font-bold">Subtotal: ${total.toFixed(2)}</Text>
        <Text className="text-base">Delivery: $6.20</Text>
        <Text className="text-xl font-bold">Total: ${(total + 6.2).toFixed(2)}</Text>
      </View>

      <TouchableOpacity className="bg-indigo-500 p-4 mt-4 rounded-full">
        <Text className="text-white text-center font-bold">Confirm Order</Text>
      </TouchableOpacity>
    </ScrollView>
  );
};

export default CartScreen;


// src/screens/ProfileScreen.js
import React from 'react';
import { View, Text, Image, Switch, TouchableOpacity } from 'react-native';
import { clearUser } from '../storage/authStorage';
import { useNavigation } from '@react-navigation/native';

const ProfileScreen = () => {
  const navigation = useNavigation();

  const logout = async () => {
    await clearUser();
    navigation.navigate('Login');
  };

  return (
    <View className="p-4 bg-white flex-1">
      <View className="items-center mb-4">
        <Image source={{ uri: 'https://placehold.co/100x100' }} className="w-24 h-24 rounded-full" />
        <Text className="text-xl font-bold mt-2">Rakibul Hasan</Text>
        <Text className="text-gray-500">rakibbrand@gmail.com</Text>
      </View>

      <View className="my-4">
        <Text>Dark Mode</Text>
        <Switch value={false} />
      </View>

      <TouchableOpacity className="bg-indigo-500 p-3 rounded-full mt-auto" onPress={logout}>
        <Text className="text-white text-center font-bold">Log Out</Text>
      </TouchableOpacity>
    </View>
  );
};

export default ProfileScreen;


// src/screens/LoginScreen.js
import React, { useState } from 'react';
import { View, TextInput, Button, Alert } from 'react-native';
import { saveUser } from '../storage/authStorage';

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const login = async () => {
    if (email && password) {
      await saveUser({ email, password });
      navigation.navigate('Home');
    } else {
      Alert.alert('Missing fields');
    }
  };

  return (
    <View className="p-4">
      <TextInput placeholder="Email" onChangeText={setEmail} className="border p-2 mb-2" />
      <TextInput placeholder="Password" secureTextEntry onChangeText={setPassword} className="border p-2 mb-4" />
      <Button title="Login" onPress={login} />
    </View>
  );
};

export default LoginScreen;


// src/screens/RegisterScreen.js
import React, { useState } from 'react';
import { View, TextInput, Button, Alert } from 'react-native';
import { saveUser } from '../storage/authStorage';

const RegisterScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const register = async () => {
    if (email && password) {
      await saveUser({ email, password });
      Alert.alert('Registration successful');
      navigation.navigate('Login');
    } else {
      Alert.alert('Please fill all fields');
    }
  };

  return (
    <View className="p-4">
      <TextInput placeholder="Email" onChangeText={setEmail} className="border p-2 mb-2" />
      <TextInput placeholder="Password" secureTextEntry onChangeText={setPassword} className="border p-2 mb-4" />
      <Button title="Register" onPress={register} />
    </View>
  );
};

export default RegisterScreen;
