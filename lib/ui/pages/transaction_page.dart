import 'package:easyplane_app/cubit/transaction_cubit.dart';
import 'package:easyplane_app/models/transaction_model.dart';
import 'package:easyplane_app/shared/theme.dart';
import 'package:easyplane_app/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text("You dont have transaction"),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(state.transactions[index]);
                });
          }
        }
        if (state is TransactionFailed) {
          return Center(
            child: Text("Something went wrong"),
          );
        }
        return Center(
          child: Text("Transaction Page"),
        );
      },
    );
  }
}
