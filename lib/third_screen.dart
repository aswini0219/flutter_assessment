import 'dart:ui';
import 'package:flutter/material.dart';

class TastingSessionSheet extends StatefulWidget {
  const TastingSessionSheet({super.key});

  @override
  State<TastingSessionSheet> createState() => _TastingSessionSheetState();
}

class _TastingSessionSheetState extends State<TastingSessionSheet> {
  String? selectedSession;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Blurred background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: BoxConstraints(maxHeight: screenHeight * 0.7),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "Tasting Session",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Veg / Non-Veg toggle
                  _vegNonVegToggle(),

                  const SizedBox(height: 20),
                  // Date selector
                  SizedBox(
                    height: 56,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _dateTile("05", "Mon", isSelected: true),
                        _dateTile("06", "Tue"),
                        _dateTile("07", "Wed"),
                        _dateTile("08", "Thu"),
                        _dateTile("09", "Fri"),
                        _dateTile("10", "Sat"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Session cards
                  _sessionCard(
                    title: "Afternoon",
                    time: "12–02PM",
                    slots: "4 slots left",
                    icon: Icons.wb_sunny_outlined,
                    dotColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _sessionCard(
                    title: "Evening",
                    time: "07–10PM",
                    slots: "4 slots left",
                    icon: Icons.nightlight_outlined,
                    dotColor: Colors.orange,
                  ),

                  const SizedBox(height: 20),

                  if (selectedSession != null) _subtotalCard(),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6318AF).withOpacity(0.5),
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("                         Next                                ", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _vegNonVegToggle() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Veg
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.circle, size: 12, color: Color(0xFF00A25C)),
                  SizedBox(width: 6),
                  Text("Veg items", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Non Veg
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.circle_outlined, size: 16, color: Color(0xFFBFBFBF)),
                  SizedBox(width: 6),
                  Text("Non Veg items", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateTile(String date, String day, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 56,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEEE4FC) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF6318AF) : Colors.grey.shade300,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date, style: TextStyle(fontSize: 12, color: isSelected ? const Color(0xFF6318AF) : Colors.black)),
          const SizedBox(height: 4),
          Text(day, style: TextStyle(fontSize: 12, color: isSelected ? const Color(0xFF6318AF) : Colors.black)),
        ],
      ),
    );
  }

  Widget _sessionCard({
    required String title,
    required String time,
    required String slots,
    required IconData icon,
    required Color dotColor,
  }) {
    final isSelected = selectedSession == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          // If already selected, unselect it; otherwise, select
          selectedSession = selectedSession == title ? null : title;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEE4FC) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF6318AF) : Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black87),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Color(0xFF262626))),
                const SizedBox(height: 2),
                Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.circle, size: 10, color: dotColor),
                const SizedBox(width: 4),
                Text(slots, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _subtotalCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Title
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Subtotal ₹30,000",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Inclusive charges and taxes",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),

            // Divider
            const SizedBox(height: 12),
            const Divider(),

            // Expanded items
            if (_isExpanded) ...[
              const SizedBox(height: 12),
              _detailRow("Plate price", "₹300"),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey, thickness: 0.8),
              const SizedBox(height: 8),
              _detailRow("No. of guests", "100"),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey, thickness: 0.8),
              const SizedBox(height: 12),

              // Nested Subtotal Box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Subtotal", style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("₹30,000", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 13)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
