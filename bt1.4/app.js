import React, { useState } from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { createStackNavigator } from "@react-navigation/stack";
import { View, Text, Button, TouchableOpacity, Image, Switch, TextInput, FlatList, ScrollView } from "react-native";
import { Ionicons } from "@expo/vector-icons";

const categories = [
  { id: "1", name: "Pizza", icon: "pizza" },
  { id: "2", name: "Burger", icon: "fast-food" },
  { id: "3", name: "Drink", icon: "beer" },
  { id: "4", name: "Rice", icon: "restaurant" }
];

const popularItems = [
  { id: "1", name: "Cheese Burger", price: "$12.99", image: require("./assets/cheese_burger.png") },
  { id: "2", name: "Pepperoni Pizza", price: "$15.49", image: require("./assets/pepperoni_pizza.png") },
  { id: "3", name: "Cold Coffee", price: "$5.99", image: require("./assets/cold_coffee.png") }
];

const HomeScreen = ({ navigation }) => (
  <ScrollView style={{ flex: 1, padding: 20 }}>
    <Text style={{ fontSize: 20, fontWeight: "bold" }}>Your Location: Savar, Dhaka</Text>
    <TextInput placeholder="Search your food..." style={{ borderWidth: 1, padding: 10, marginVertical: 10 }} />
    
    <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 10 }}>Categories</Text>
    <FlatList
      horizontal
      data={categories}
      keyExtractor={(item) => item.id}
      renderItem={({ item }) => (
        <TouchableOpacity style={{ padding: 10, backgroundColor: "#ddd", margin: 5 }}>
          <Ionicons name={item.icon} size={20} color="black" />
          <Text>{item.name}</Text>
        </TouchableOpacity>
      )}
    />
    
    <TouchableOpacity onPress={() => navigation.navigate("Cart")} style={{ padding: 20, backgroundColor: "black", marginTop: 20 }}>
      <Image source={require("./assets/burger.png")} style={{ width: 100, height: 100 }} />
      <Text style={{ color: "white" }}>BURGER - Today's Hot Offer - 10% OFF</Text>
    </TouchableOpacity>
    
    <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 20 }}>Popular Items</Text>
    <FlatList
      data={popularItems}
      keyExtractor={(item) => item.id}
      renderItem={({ item }) => (
        <TouchableOpacity style={{ padding: 10, backgroundColor: "#f8f8f8", margin: 5 }}>
          <Image source={item.image} style={{ width: 100, height: 100, borderRadius: 10 }} />
          <Text>{item.name}</Text>
          <Text>{item.price}</Text>
        </TouchableOpacity>
      )}
    />
  </ScrollView>
);

const CartScreen = ({ navigation }) => (
  <View style={{ flex: 1, padding: 20 }}>
    <Text style={{ fontSize: 20, fontWeight: "bold" }}>Shopping Cart</Text>
    <Image source={require("./assets/burger.png")} style={{ width: 80, height: 80 }} />
    <Text>Burger - $28 x 2 = $56</Text>
    <Text>Delivery Fee: $6.20</Text>
    <Text>Total: $62.20</Text>
    
    <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 20 }}>Delivery Location</Text>
    <TextInput placeholder="Enter your address..." style={{ borderWidth: 1, padding: 10, marginVertical: 10 }} />
    
    <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 20 }}>Rate Your Order</Text>
    <View style={{ flexDirection: "row", marginVertical: 10 }}>
      {[1, 2, 3, 4, 5].map((star) => (
        <Ionicons key={star} name="star-outline" size={24} color="gold" style={{ marginHorizontal: 5 }} />
      ))}
    </View>
    
    <TouchableOpacity style={{ padding: 15, backgroundColor: "blue", marginTop: 20 }} onPress={() => alert("Order Confirmed!")}>
      <Text style={{ color: "white", textAlign: "center" }}>Confirm Order</Text>
    </TouchableOpacity>
  </View>
);

const ProfileScreen = () => {
  const [darkMode, setDarkMode] = useState(false);
  return (
    <ScrollView style={{ flex: 1, padding: 20 }}>
      <Text style={{ fontSize: 20, fontWeight: "bold" }}>Profile</Text>
      <Image source={require("./assets/profile.png")} style={{ width: 100, height: 100, borderRadius: 50 }} />
      <Text>Name: Rakibul Hasan</Text>
      <Text>Email: rakibbrand@gmail.com</Text>
      <TextInput placeholder="Update Name" style={{ borderWidth: 1, padding: 10, marginVertical: 10 }} />
      <TextInput placeholder="Update Email" style={{ borderWidth: 1, padding: 10, marginVertical: 10 }} />
      <Button title="Save Changes" onPress={() => alert("Profile Updated!")} />
      
      <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 20 }}>Order History</Text>
      <FlatList
        data={["Order #1 - $20", "Order #2 - $35", "Order #3 - $50"]}
        keyExtractor={(item, index) => index.toString()}
        renderItem={({ item }) => <Text>{item}</Text>}
      />
      
      <Text style={{ fontSize: 18, fontWeight: "bold", marginTop: 20 }}>Settings</Text>
      <Text>Dark Mode</Text>
      <Switch value={darkMode} onValueChange={setDarkMode} />
      <Button title="Change Password" onPress={() => alert("Password Change Requested!")} />
      <Button title="Log Out" onPress={() => alert("Logged Out!")} />
    </ScrollView>
  );
};

const Tab = createBottomTabNavigator();
const Stack = createStackNavigator();

const HomeStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="Home" component={HomeScreen} />
    <Stack.Screen name="Cart" component={CartScreen} />
  </Stack.Navigator>
);

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={({ route }) => ({
          tabBarIcon: ({ color, size }) => {
            let iconName;
            if (route.name === "Home") iconName = "home";
            else if (route.name === "Cart") iconName = "cart";
            else if (route.name === "Profile") iconName = "person";
            return <Ionicons name={iconName} size={size} color={color} />;
          },
        })}
      >
        <Tab.Screen name="Home" component={HomeStack} />
        <Tab.Screen name="Cart" component={CartScreen} />
        <Tab.Screen name="Profile" component={ProfileScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
