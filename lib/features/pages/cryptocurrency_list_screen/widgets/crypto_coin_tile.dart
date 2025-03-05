import 'package:auto_route/auto_route.dart';
import 'package:cryptoview/router/router.dart';
import 'package:flutter/material.dart';
import 'package:cryptoview/repositories/repository.dart';

class CryptoCoinTileWidget extends StatelessWidget {
  const CryptoCoinTileWidget({super.key, required this.cryptoCoin});

  final CryptoCoin cryptoCoin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://cryptocompare.com${cryptoCoin.image}',
        width: 60,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
      title: Text(
        '${cryptoCoin.name}',
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Text(
        '${cryptoCoin.price}',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      onTap: () {
        AutoRouter.of(context).push(AboutCryptoCoinRoute(coin: cryptoCoin));
        // Navigator.pushNamed(
        //   context,
        //   '/aboutCryptoCoinScreen',
        //   arguments: <String, CryptoCoin>{'coin': cryptoCoin},
        // );
      },
    );
  }
}
