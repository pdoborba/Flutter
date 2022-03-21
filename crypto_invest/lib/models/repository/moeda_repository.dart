import 'package:crypto_invest/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> table = [
    Moeda(
      icone: 'images/bitcoin.png',
      name: 'Bitcoin',
      sig: 'BTC',
      price: 164603.00,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      name: 'Ethereum',
      sig: 'ETH',
      price: 9716.00,
    ),
    Moeda(
      icone: 'images/xrp.png',
      name: 'XRP',
      sig: 'XRP',
      price: 3.34,
    ),
    Moeda(
      icone: 'images/cardano.png',
      name: 'Cardano',
      sig: 'ADA',
      price: 6.32,
    ),
    Moeda(
      icone: 'images/usdcoin.png',
      name: 'USD Coin',
      sig: 'USDC',
      price: 5.02,
    ),
    Moeda(
      icone: 'images/litecoin.png',
      name: 'Litecoin',
      sig: 'LTC',
      price: 669.93,
    ),
  ];
}
