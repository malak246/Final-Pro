import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Your App Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGGED IN AS: ${user.email ?? 'Unknown'}",
              style: const TextStyle(fontSize: 20),
            ),

            // Add your other content here
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                // Navigate to GPS page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GPSPickerPage()),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.grey[800]!,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey[800]!,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ],
              selectedIndex: 0,
              onTabChange: (index) {
                // Handle tab changes
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GPSPickerPage extends StatelessWidget {
  const GPSPickerPage({super.key});

  Future<void> _getLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // استخدم position للوصول إلى معلومات الموقع
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Nearest Parking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'GPS Picker Page',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                _getLocation(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentMethodPage()),
                );
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodPage extends StatelessWidget {
  // Define payment methods
  final List<String> paymentMethods = ['Credit Card', 'PayPal', 'Cash'];

  // Variable to store the selected payment method
  String selectedPaymentMethod = 'Credit Card';

  PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Payment Method Page',
              style: TextStyle(fontSize: 24),
            ),
            // DropdownButton to select payment method
            DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  // Update selected payment method
                  selectedPaymentMethod = newValue;
                }
              },
              items:
                  paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform payment based on selected method
                performPayment(selectedPaymentMethod);
                // Navigate to home page after payment
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle payment based on selected method
  void performPayment(String paymentMethod) {
    // Implement your payment logic here based on the selected payment method
    print('Paying with $paymentMethod');
  }
}

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Parking App',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement parking reservation logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReserveParkingPage()),
                );
              },
              child: const Text('Reserve Parking'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement service request logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RequestServicePage()),
                );
              },
              child: const Text('Request Service'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReserveParkingPage extends StatelessWidget {
  final List<int> reservedSlots = [2, 4, 6];

  ReserveParkingPage({super.key}); // Mocking reserved slots

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve Parking'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10, // Assuming there are 10 slots
          itemBuilder: (BuildContext context, int index) {
            final slotNumber = index + 1;
            final isReserved = reservedSlots.contains(slotNumber);

            return ListTile(
              title: Text('Slot $slotNumber'),
              subtitle:
                  isReserved ? const Text('Reserved') : const Text('Available'),
              trailing: isReserved
                  ? null
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ConfirmReservationPage()),
                        );
                        // Implement reservation logic here
                        // You can navigate to a confirmation page or perform any necessary actions
                      },
                      child: const Text('Reserve'),
                    ),
            );
          },
        ),
      ),
    );
  }
}

class ConfirmReservationPage extends StatelessWidget {
  const ConfirmReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve Parking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select a timeslot:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement reservation logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Reservation'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selected Timeslot:'),
                          Text('Date: ...'), // Display selected date
                          Text('Time: ...'), // Display selected time
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implement reservation confirmation logic here
                            Navigator.of(context).pop();
                            // Add further actions after reservation confirmation
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Reserve'),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestServicePage extends StatelessWidget {
  const RequestServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Service'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Implement service request logic for charging here
                _showServiceRequestConfirmation(context);
              },
              child: const Text('Charge Car'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement service request logic for car wash here
                _showServiceRequestConfirmation(context);
              },
              child: const Text('Car Wash'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement service request logic for maintenance here
                _showServiceRequestConfirmation(context);
              },
              child: const Text('Car Maintenance'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showServiceRequestConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Service Requested"),
        content:
            const Text("Your service request has been submitted successfully."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
