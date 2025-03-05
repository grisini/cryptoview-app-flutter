import 'package:cryptoview/repositories/models/models.dart';
import 'package:flutter/material.dart';

class CoinInfoPage extends StatefulWidget {
  const CoinInfoPage({super.key, required this.coin});

  final CryptoCoinDetail? coin;

  @override
  State<CoinInfoPage> createState() => _CoinInfoPageState();
}

class _CoinInfoPageState extends State<CoinInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          widget.coin != null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://cryptocompare.com${widget.coin!.imageurl}',
                      width: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.coin!.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${widget.coin!.price} \$',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'High 24h',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.coin!.high24h.toStringAsFixed(3)} \$',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Low 24h',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.coin!.low24h.toStringAsFixed(3)} \$',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Change 24h',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.coin!.change24h.toStringAsFixed(3)} \$',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Change 1h',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.coin!.change1h.toStringAsFixed(3)} \$',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: double.infinity),
                  ],
                ),
              )
              : const Center(child: Text('Crypto Coin data is not available')),
    );
  }
}
