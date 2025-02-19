import React, { useState } from "react";
import { View, Text, TouchableOpacity, StyleSheet } from "react-native";

const ParentComponent = () => {
  const [backgroundColor, setBackgroundColor] = useState("#ffffff");

  const changeBackgroundColor = (color) => {
    setBackgroundColor(color);
  };

  return (
    <View style={[styles.container, { backgroundColor }]}>
      <Text style={styles.text}>Chọn màu nền cho component cha:</Text>

      <TouchableOpacity
        style={[styles.button, { backgroundColor: "red" }]}
        onPress={() => changeBackgroundColor("red")}
      >
        <Text style={styles.buttonText}>Màu đỏ</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.button, { backgroundColor: "blue" }]}
        onPress={() => changeBackgroundColor("blue")}
      >
        <Text style={styles.buttonText}>Màu xanh</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.button, { backgroundColor: "yellow" }]}
        onPress={() => changeBackgroundColor("yellow")}
      >
        <Text style={styles.buttonText}>Màu vàng</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.button, { backgroundColor: "green" }]}
        onPress={() => changeBackgroundColor("green")}
      >
        <Text style={styles.buttonText}>Màu xanh lá cây</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    padding: 20,
  },
  text: {
    fontSize: 20,
    marginBottom: 20,
  },
  button: {
    width: "100%",
    paddingVertical: 15,
    marginBottom: 10,
    borderRadius: 5,
    alignItems: "center",
    justifyContent: "center",
  },
  buttonText: {
    color: "#fff",
    fontSize: 16,
  },
});

export default ParentComponent;
