import React from 'react';
import { SafeAreaView, ScrollView, View, Text, StyleSheet, Image } from 'react-native';

const notifications = [
  {
    title: "Bước 1 Xác định nhu cầu khách hàng",
    description: "Vũ Văn Hoàng sắp đến hạn lúc 01/08/2020 9:00",
    date: "20/08/2020, 06:00",
  },
  {
    title: "Bạn có khách hàng mới!",
    description: "Chúc mừng bạn, bạn có khách hàng mới. Hãy mau chóng liên lạc ngay!",
    date: "20/08/2020, 06:00",
  },
  {
    title: "Khách hàng được chia sẽ bị trùng",
    description: "Rất tiếc, khách hàng được chia sẽ đã tồn tại trên hệ thống. Vui lòng chia sẻ khách hàng khác.",
    date: "20/08/2020, 06:00",
  },
  {
    title: "Khách hàng được thêm bị trùng",
    description: "Rất tiếc, khách hàng được thêm đã tồn tại trên hệ thống. Vui lòng thêm khách hàng khác.",
    date: "20/08/2020, 06:00",
  },
  {
    title: "Công việc sắp đến hạn trong hôm nay",
    description: "Bạn có 17 công việc sắp đến hạn trong hôm nay.",
    date: "20/08/2020, 06:00",
  },
  {
    title: "Công việc đã quá hạn",
    description: "Bạn có 17 công việc đã quá hạn. Hãy kiểm tra và lên kế hoạch hoàn thành công việc.",
    date: "20/08/2020, 06:00",
  },
];

const App = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.header}>Thông báo</Text>
      <ScrollView>
        {notifications.map((notification, index) => (
          <View key={index} style={styles.card}>
            <View style={styles.iconContainer}>
              <Image
                source={{ uri: 'https://cdn-icons-png.flaticon.com/512/1946/1946429.png' }}
                style={styles.icon}
              />
            </View>
            <View style={styles.textContainer}>
              <Text style={styles.title}>{notification.title}</Text>
              <Text style={styles.description}>{notification.description}</Text>
              <Text style={styles.date}>{notification.date}</Text>
            </View>
          </View>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginVertical: 20,
  },
  card: {
    flexDirection: 'row',
    backgroundColor: '#E7F3FF',
    marginHorizontal: 20,
    marginVertical: 10,
    borderRadius: 10,
    padding: 15,
  },
  iconContainer: {
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  icon: {
    width: 40,
    height: 40,
  },
  textContainer: {
    flex: 1,
  },
  title: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 5,
  },
  description: {
    fontSize: 14,
    color: '#555',
    marginBottom: 5,
  },
  date: {
    fontSize: 12,
    color: '#888',
  },
});

export default App;
